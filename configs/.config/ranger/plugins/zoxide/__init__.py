import os.path
# from posixpath import split
import ranger.api
import ranger.core.fm
import ranger.ext.signals
from subprocess import Popen, PIPE

from shutil import which

hook_init_prev = ranger.api.hook_init

def hook_init(fm):
    def zoxide_add(signal):
        path = signal.new.path
        process = Popen(["zoxide", "add", path])
        process.wait()

    fm.signal_bind("cd", zoxide_add)
    return hook_init_prev(fm)


if which("zoxide") is not None:
    ranger.api.hook_init = hook_init

class z(ranger.api.commands.Command):
    """
    :z

    Jump around with zoxide (z)
    """
    def execute(self):
        args = self.rest(1).split()
        if args:
            if os.path.isdir(args[0]):
                self.fm.cd(args[0])
        else:
            self.fm.notify("No results from zoxide", bad=True)
        # results = self.query(self.args[1:])
        # if os.path.isdir(results[0]):
        #     self.fm.cd(results[0])

    def query(self, args):
        try:
            p = Popen(
                ["zoxide", "query", "-ls"] + self.args[1:],
                stdout=PIPE,
                stderr=PIPE
            )
            stdout, stderr = p.communicate()
            if p.returncode == 0:
                output = stdout.decode("utf-8").strip()
                if output:
                    return [" ".join(x.split()[1:]) for x in output.splitlines()]
                else:
                    self.fm.notify("zoxide exited with status {}".format(p.returncode), bad=True)
            else:
                output = stderr.decode("utf-8").strip() or "zoxide: unexpected error"
                self.fm.notify(output, bad=True)
        except Exception as e:
            self.fm.notify(e, bad=True)

    # def tab(self, tabnum):
    #     results = self.query(self.args[1:])
    #     # return results[0]
    #     return ["z {}".format(x) for x in results]

    def tab(self, tabnum):
        start, current = self.start(1), self.rest(1)
        results = self.query(self.args[1:])
        for path in results:
            yield start + path
