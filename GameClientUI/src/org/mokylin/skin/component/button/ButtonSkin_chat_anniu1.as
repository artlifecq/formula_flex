package org.mokylin.skin.component.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_chat_anniu1 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_chat_anniu1()
		{
			super();
			
			this.currentState = "down";
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"textAlign",
							value:"left"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xFFFFFF
						}
					]
			};
			skinNames={"disabled":"ui/component/button/skin_chat_anniu1/disable.png",
			"down":"ui/component/button/skin_chat_anniu1/down.png",
			"hover":"ui/component/button/skin_chat_anniu1/over.png",
			"up":"ui/component/button/skin_chat_anniu1/up.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function iconDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDisplay = temp;
			temp.name = "iconDisplay";
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 23;
			temp.textAlign = "left";
			temp.color = 0xFFFFFF;
			temp.width = 52;
			temp.x = 2;
			temp.y = 1;
			return temp;
		}

	}
}