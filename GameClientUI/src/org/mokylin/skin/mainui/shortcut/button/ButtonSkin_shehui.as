package org.mokylin.skin.mainui.shortcut.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_shehui extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __ButtonSkin_shehui_UIAsset1:feathers.controls.UIAsset;

		public var __ButtonSkin_shehui_UIAsset2:feathers.controls.UIAsset;

		public var __ButtonSkin_shehui_UIAsset3:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_shehui()
		{
			super();
			
			this.currentState = "up";
			this.elementsContent = [labelDisplay_i()];
			__ButtonSkin_shehui_UIAsset1_i();
			__ButtonSkin_shehui_UIAsset2_i();
			__ButtonSkin_shehui_UIAsset3_i();
			
			
			states = {
				up:[
						{target:"__ButtonSkin_shehui_UIAsset3",
							propertyName:"",
							position:"before",
							relativeTo:"labelDisplay"
						}
					]
				,
				hover:[
						{target:"__ButtonSkin_shehui_UIAsset2",
							propertyName:"",
							position:"before",
							relativeTo:"labelDisplay"
						}
					]
				,
				down:[
						{target:"__ButtonSkin_shehui_UIAsset1",
							propertyName:"",
							position:"before",
							relativeTo:"labelDisplay"
						}
					]
				,
				disabled:[
					]
				,
				init:[
						{target:"labelDisplay",
							name:"align",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xFFFFFF
						}
					]
			};
			skinNames={hover:"ui/mainui/shortcut/button/skin_shehui/over.png",	down:"ui/mainui/shortcut/button/skin_shehui/down.png",	up:"ui/mainui/shortcut/button/skin_shehui/up.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ButtonSkin_shehui_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonSkin_shehui_UIAsset1 = temp;
			temp.styleName = "ui/mainui/shortcut/button/skin_shehui/down.png";
			return temp;
		}

		private function __ButtonSkin_shehui_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonSkin_shehui_UIAsset2 = temp;
			temp.styleName = "ui/mainui/shortcut/button/skin_shehui/over.png";
			return temp;
		}

		private function __ButtonSkin_shehui_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonSkin_shehui_UIAsset3 = temp;
			temp.styleName = "ui/mainui/shortcut/button/skin_shehui/up.png";
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.text = "";
			return temp;
		}

	}
}