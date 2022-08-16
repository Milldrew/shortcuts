This repository is for rewriting a plugin that automatically creates shortcuts to each directory within a project. this plugin is currently living inside of vimrc like file.

<h2>
User Story: 
</h2>
  <p>
  <li>
  The user can download the plugin using packer package manager. On startup the package checks a set which includes the capital letter version of each alphabetical character A-Z. These characters will act as the command prefix. The command will act is a shortcut.
  </li>
  <li>If an environemnt variable exists whose name matches a character in the set. The value of that environment variable will be used as the root directory.</li>
  <li>The user can set the root directory of the project and set the command prefix</li>
  <li>We will find the first three letters of every directory in the project and use those letters as the command suffix</li>
  <li>If their is a name collision the command will be incremented for example. If there are three directories in the project whose names start with the letters 'c', 'o', 'm'. The following commands will be created Acom Acom1 Acom2</li>
  <li>The commands will lead the user directly to the matching directory in vim.</li>
  </p>
