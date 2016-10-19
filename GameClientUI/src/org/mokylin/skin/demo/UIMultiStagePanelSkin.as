package org.mokylin.skin.demo
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.check.CheckBoxSkin_gold;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class UIMultiStagePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __UIMultiStagePanelSkin_UIAsset1:feathers.controls.UIAsset;

		public var __UIMultiStagePanelSkin_UIAsset2:feathers.controls.UIAsset;

		public var lb:feathers.controls.Label;

		public var multiCheck:feathers.controls.Check;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function UIMultiStagePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 58;
			this.width = 361;
			this.elementsContent = [lb_i(),multiCheck_i(),__UIMultiStagePanelSkin_UIAsset1_i(),__UIMultiStagePanelSkin_UIAsset2_i()];
			
			states = {
				normal:[
						{target:"lb",
							name:"color",
							value:0x644242
						}
						,
						{target:"lb",
							name:"text",
							value:"normal状态"
						}
						,
						{target:"multiCheck",
							name:"height",
							value:20
						}
						,
						{target:"__UIMultiStagePanelSkin_UIAsset1",
							name:"visible",
							value:false
						}
					]
				,
				select:[
						{target:"lb",
							name:"text",
							value:"select状态"
						}
						,
						{target:"lb",
							name:"color",
							value:0xC42121
						}
						,
						{target:"__UIMultiStagePanelSkin_UIAsset2",
							name:"visible",
							value:false
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __UIMultiStagePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__UIMultiStagePanelSkin_UIAsset1 = temp;
			temp.styleName = "ui/common/grid/select/40.png";
			temp.x = 7;
			temp.y = 10;
			return temp;
		}

		private function __UIMultiStagePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__UIMultiStagePanelSkin_UIAsset2 = temp;
			temp.styleName = "ui/common/grid/select/46.png";
			temp.x = 5;
			temp.y = 9;
			return temp;
		}

		private function lb_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb = temp;
			temp.name = "lb";
			temp.text = "所有状态";
			temp.color = 0x836565;
			temp.width = 177;
			temp.x = 63;
			temp.y = 17;
			return temp;
		}

		private function multiCheck_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			multiCheck = temp;
			temp.name = "multiCheck";
			temp.label = "选择";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_gold);
			temp.width = 57;
			temp.x = 188;
			temp.y = 17;
			return temp;
		}

	}
}