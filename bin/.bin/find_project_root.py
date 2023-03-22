#!/usr/bin/env python

import os
import sys

def find_project_root(file_path):
    """
    Find the project root directory containing the given file.

    Args:
        file_path (str): Path of a file.

    Returns:
        str: Path of the project root directory containing the file,
             or the original file path if no project root is found.
    """
    # Define markers that indicate the project root directory.
    markers = ['setup.py', '.git', 'package.json', 'tsconfig.json']

    # Traverse up the directory tree from the file path.
    path = os.path.abspath(file_path)
    while True:
        # Check if the current directory contains a project root marker.
        for marker in markers:
            if os.path.exists(os.path.join(path, marker)):
                return path

        # Move up to the parent directory.
        parent_path = os.path.dirname(path)
        if parent_path == path:
            # Reached the root of the file system without finding a project root marker.
            return file_path
        path = parent_path

if __name__ == '__main__':
    # Read the file path from the command line.
    file_path = sys.argv[1]

    # Find the project root and print the result.
    project_root = find_project_root(file_path)
    print(project_root)
