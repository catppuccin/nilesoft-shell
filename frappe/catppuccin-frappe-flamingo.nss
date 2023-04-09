shell
{
	var
	{
		isw11=sys.is11
	}
	
	set
	{
		theme
		{
			name = "modern"
			
			background
			{
				color = #303446
				opacity = 100
				// effect = 2
			}

			item
			{
				opacity = 100

				prefix = 1

				text
				{
					normal = #c6d0f5
					select = #c6d0f5
					normal-disabled = #a5adce
					select-disabled = #a5adce
				}

				back
				{
					select = #51576d
					select-disabled = #414559
				}
			}

			border
			{
				enabled = true
				size = 1
				color = #eebebe
				opacity = 100
				radius = 2
			}

			shadow
			{
				enabled = true
				size = 5
				opacity = 5
				color = #232634
			}

			separator
			{
				size = 1
				color = #414559
			}

			symbol
			{
				normal = #eebebe
				select = #eebebe
				normal-disabled = #a5adce
				select-disabled = #a5adce
			}

			image
			{
				enabled = true
				color = [#c6d0f5, #eebebe, #303446]
			}
		}		
		
		exclude.where = !process.is_explorer
		showdelay=200
	}

	images import 'imports/images.nss'

	static
	{	
		import 'imports/static.nss'
		item(where=this.title.length > 25 menu=title.more_options)
	}

	dynamic
	{
		menu(mode="multiple" title="Pin/Unpin" image=icon.pin) { }
		menu(mode="multiple" title=title.more_options image=icon.more_options) { }
		
		import 'imports/file-manage.nss'
		import 'imports/develop.nss'
		import 'imports/goto.nss'
		
		menu(type="taskbar" vis=key.shift() pos=0 title=app.name image=\uE249)
		{
			item(title="config" image=\uE10A cmd='"@app.cfg"')
			item(title="manager" image=\uE0F3 admin cmd='"@app.exe"')
			item(title="directory" image=\uE0E8 cmd='"@app.dir"')
			item(title="version\t"+@app.ver vis=label col=1)
			item(title="docs" image=\uE1C4 cmd='https://nilesoft.org/docs')
			item(title="donate" image=\uE1A7 cmd='https://nilesoft.org/donate')
		}
		
		import if(isw11, 'imports/taskbar.nss')
	}
}
