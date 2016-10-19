package org.mokylin.skin.app.country.society
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class OtherCountrySocietyListPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var emptyTips:feathers.controls.UIAsset;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function OtherCountrySocietyListPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__OtherCountrySocietyListPanelSkin_UIAsset1_i(),emptyTips_i(),__OtherCountrySocietyListPanelSkin_UIAsset2_i(),__OtherCountrySocietyListPanelSkin_UIAsset3_i(),list_i(),__OtherCountrySocietyListPanelSkin_Label1_i(),__OtherCountrySocietyListPanelSkin_UIAsset4_i(),__OtherCountrySocietyListPanelSkin_Label2_i(),__OtherCountrySocietyListPanelSkin_UIAsset5_i(),__OtherCountrySocietyListPanelSkin_UIAsset6_i(),__OtherCountrySocietyListPanelSkin_UIAsset7_i(),__OtherCountrySocietyListPanelSkin_Label3_i(),__OtherCountrySocietyListPanelSkin_Label4_i(),__OtherCountrySocietyListPanelSkin_Label5_i(),__OtherCountrySocietyListPanelSkin_Label6_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __OtherCountrySocietyListPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "家族名称";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 287;
			temp.y = 21;
			return temp;
		}

		private function __OtherCountrySocietyListPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "家族等级";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 428;
			temp.y = 21;
			return temp;
		}

		private function __OtherCountrySocietyListPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "家族人数";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 645;
			temp.y = 21;
			return temp;
		}

		private function __OtherCountrySocietyListPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "活跃在线";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 533;
			temp.y = 21;
			return temp;
		}

		private function __OtherCountrySocietyListPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "所属国家";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 767;
			temp.y = 21;
			return temp;
		}

		private function __OtherCountrySocietyListPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "家族名称";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 71;
			temp.y = 21;
			return temp;
		}

		private function __OtherCountrySocietyListPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 485;
			temp.styleName = "ui/app/country/niupizhi/di.png";
			temp.width = 870;
			temp.x = 7;
			temp.y = 5;
			return temp;
		}

		private function __OtherCountrySocietyListPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 51;
			temp.styleName = "ui/app/country/niupizhi/liebiaodi_da.png";
			temp.width = 867;
			temp.x = 8;
			temp.y = 6;
			return temp;
		}

		private function __OtherCountrySocietyListPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 97;
			temp.y = 19;
			return temp;
		}

		private function __OtherCountrySocietyListPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 288;
			temp.y = 19;
			return temp;
		}

		private function __OtherCountrySocietyListPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 492;
			temp.y = 19;
			return temp;
		}

		private function __OtherCountrySocietyListPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 379;
			temp.y = 19;
			return temp;
		}

		private function __OtherCountrySocietyListPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 603;
			temp.y = 19;
			return temp;
		}

		private function emptyTips_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			emptyTips = temp;
			temp.name = "emptyTips";
			temp.styleName = "ui/app/country/bangpai/taguoweijian.png";
			temp.x = 142;
			temp.y = 130;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 438;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 862;
			temp.x = 10;
			temp.y = 44;
			return temp;
		}

	}
}