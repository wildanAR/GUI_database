import subprocess

def run(*args):

    return subprocess.check_call(['git'] + list(args))

def clone():

    print("\nYou will be asked for the user first and then the repository name\n")

    user = input("User: ")
    repo = input("Repository: ")

    print("\nChoose the local path for your clone.")
    local_path = input("Local path: ")

    subprocess.Popen(['git', 'clone', "https://github.com/" + user + "/" + repo + ".git", local_path])

def commit():

    commit_message = input("\nType in your commit message: ")
    run("commit", "-am", commit_message)
    run("push", "-u", "origin", "master")

def branch():

    branch = input("\nType in the name of the branch you want to make: ")
    run("checkout", "-b", branch)

    choice = input("\nDo you want to push the branch right now to GitHub? (y/n): ").lower()

    if choice == "y":
        run("push", "-u", "origin", branch)
    else:
        print("\nOkay, goodbye!\n")

def main():

    choices = 'clone, commit, branch, pull, merge, blame and stash'
    print("Commands to use: " + choices)

    choose_command = input('Type in the command you want to use: ').lower()

    dict = {
        'clone': clone,
        'commit': commit,
        'branch': branch,
        'pull': pull,
        'fetch': fetch,
        'merge': merge,
        'reset': reset,
        'blame': blame
    }

    dict.get(choose_command, lambda: "Invalid")()


# run('push','origin')
# run('status')
run('add','--all')