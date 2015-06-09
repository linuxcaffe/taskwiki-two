# two
_Task Wiki Opener_ 

**two** is designed to open or create or list or search [taskwarrior](http://taskwarrior.org) related wiki files and template files. It enhances [TaskWiki](https://github.com/tbabej/taskwiki), and can take advantage of [vim-template](https://github.com/aperezdc/vim-template) to quickly edit/ create/ locate project wiki files.

![taskwiki](http://picpaste.novarata.net/pics/9932eca5814fce48c26cd8105b4a165a.gif)
* note: the above image doesn't actually show **two** in action, 
  but it _does_ show vim-template-generated taskwiki project files 
  (and Tagbar, and NERDtree) that **two** is designed to juggle.

### Requirements
- [taskwarrior](http://taskwarrior.org/download/) -- If you're not using this command-line todo manager, to track you tasks, then not much of the following will apply to you. Try it out and come back later!
- [TaskWiki](https://github.com/tbabej/taskwiki) is the way to use taskwarrior tasks in
- [vimwiki](https://github.com/vimwiki/vimwiki/tree/tags) is a personal wiki for vim

To set your own locations or wiki filetypes, edit the initial variables in the script . 

The defaults are ~/.task/wiki/attribute/name.attribute.wiki 

and templates in ~/.vim/template/template.attribute.wiki

and the "attribute" is presumed to be "project" unless otherwise specified.

### Recommendations
- vim-template
- vim-tagbar

### Usage
<pre>
two [proj_name | attribute:[value] | -g string | -l [name] | -t [template] | -h]
</pre>
### Examples
<pre>
two
</pre>
Opens the primary taskwiki index file at (by default) ~/.task/wiki/index.wiki
<pre>
two foo
</pre>
Opens (by default) ~/.task/wiki/project/foo.project.wiki (same as 'two project:foo')
<pre>
two area:bar
</pre>
Would open ~/.task/wiki/area/bar.area.wiki (by default). Two is project-centric, but you can easily use wiki files for task attributes _other_ than project: (like tag:something , or uda:random) by using the ":" colon separator.
The folders in the wiki root have to pre-exist for this to work. Future versions might prompt you to create them otherwise.
<pre>
two area:
</pre>
Would open ~/.task/wiki/area/index.wiki
<pre>
two +biz
</pre>
Would open ~/.task/wiki/tag/biz.tag.wiki (same as 'two tag:biz')
<pre>
two -l [name]
</pre>
Shows a tree of wiki files, under the taskwiki root, using [part_of_name] for case-insensitive search
<pre>
two -g fix
</pre>
Searches (grep) the files in the taskwiki root for the string "fix" and show a list of matching files
<pre>
two -t [template name]
</pre>
To edit template file or (without [template name]) displays a tree of the template folder
</pre>
<pre>
two -h
</pre>
Shows basic usage and help

more features are planned; like working with attributes other than project, and printing taskwiki files

.. more docs to come! suggestions and improvements welcome.
