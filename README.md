# two
_Task Wiki Opener_ 

**two** is designed to open (and create and list and search) [taskwarrior](http://taskwarrior.org) related wiki files. It enhances [TaskWiki](https://github.com/tbabej/taskwiki), and can take advantage of [vim-template](https://github.com/aperezdc/vim-template) to quickly create and locate project wiki files.

![taskwiki](http://picpaste.novarata.net/pics/9932eca5814fce48c26cd8105b4a165a.gif)
* note: the above image doesn't actually show **two** in action, 
  but it _does_ show vim-template-generated taskwiki project files 
  (and Tagbar, and NERDtree) that **two** is designed to juggle.

### Requirements
- [taskwarrior](http://taskwarrior.org/download/) -- If you're not using this command-line todo manager, to track you tasks, then not much of the following will apply to you. Try it out and come back later!
- [TaskWiki](https://github.com/tbabej/taskwiki) is the way to use taskwarrior tasks in
- [vimwiki](https://github.com/vimwiki/vimwiki/tree/tags) is a personal wiki for vim

follow the links above, these requirements have their own requirements, recommendations and install instructions.. there's a lot going on here, but it's worth the effort!

### Recommendations
- vim-template
- vim-tagbar

### So what can two do?
<pre>
two
</pre>
will open the primary taskwiki index file at (by default) ~/.task/wiki/index.wiki
<pre>
two foo
</pre>
will open (by default) ~/.task/wiki/project/foo.project.wiki
<pre>
two -l
</pre>
will show a tree of wiki files, under the taskwiki root
<pre>
two -g fix
</pre>
will search (grep) the taskwiki root for the string "fix" and show a list of matching files

more features are planned; like working with attributes other than project, and printing taskwiki files

.. more docs to come! suggestions and improvements welcome.
