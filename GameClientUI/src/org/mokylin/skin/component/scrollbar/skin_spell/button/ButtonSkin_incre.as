package org.mokylin.skin.component.scrollbar.skin_spell.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_incre extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_incre()
		{
			super();
			
			this.currentState = "down";
			this.height = 18;
			this.width = 18;
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xFFFFFF
						}
					]
			};
			skinNames={"down":"ui/component/scrollbar/skin_spell/button/skin_incre/down.png", "hover":"ui/component/scrollbar/skin_spell/button/skin_incre/over.png", "up":"ui/component/scrollbar/skin_spell/button/skin_incre/up.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.text = "";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.top = 0;
			return temp;
		}

	}
}