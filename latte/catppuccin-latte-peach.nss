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
				color = #eff1f5
				opacity = 100
				// effect = 2
			}

			item
			{
				opacity = 100

				prefix = 1

				text
				{
					normal = #4c4f69
					select = #4c4f69
					normal-disabled = #6c6f85
					select-disabled = #6c6f85
				}

				back
				{
					select = #bcc0cc
					select-disabled = #ccd0da
				}
			}

			border
			{
				enabled = true
				size = 1
				color = #fe640b
				opacity = 100
				radius = 2
			}

			shadow
			{
				enabled = true
				size = 5
				opacity = 5
				color = #dce0e8
			}

			separator
			{
				size = 1
				color = #ccd0da
			}

			symbol
			{
				normal = #fe640b
				select = #fe640b
				normal-disabled = #6c6f85
				select-disabled = #6c6f85
			}

			image
			{
				enabled = true
				color = [#4c4f69, #fe640b, #eff1f5]
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
