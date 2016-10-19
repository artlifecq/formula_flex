package org.mokylin.skin.app.country
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
	public class GuanYuanMingCePanelSkin extends feathers.controls.StateSkin
	{
		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuanYuanMingCePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 496;
			this.width = 883;
			this.elementsContent = [__GuanYuanMingCePanelSkin_UIAsset1_i(),__GuanYuanMingCePanelSkin_UIAsset2_i(),__GuanYuanMingCePanelSkin_UIAsset3_i(),__GuanYuanMingCePanelSkin_UIAsset4_i(),__GuanYuanMingCePanelSkin_UIAsset5_i(),__GuanYuanMingCePanelSkin_UIAsset6_i(),__GuanYuanMingCePanelSkin_UIAsset7_i(),list_i(),__GuanYuanMingCePanelSkin_Label1_i(),__GuanYuanMingCePanelSkin_Label2_i(),__GuanYuanMingCePanelSkin_Label3_i(),__GuanYuanMingCePanelSkin_Label4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuanYuanMingCePanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "官职";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 240;
			temp.y = 16;
			return temp;
		}

		private function __GuanYuanMingCePanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "玩家名称";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 413;
			temp.y = 16;
			return temp;
		}

		private function __GuanYuanMingCePanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "所在帮派";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 579;
			temp.y = 16;
			return temp;
		}

		private function __GuanYuanMingCePanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "在线状态";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 739;
			temp.y = 16;
			return temp;
		}

		private function __GuanYuanMingCePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 483;
			temp.styleName = "ui/app/country/shu.png";
			temp.width = 3;
			temp.x = 215;
			temp.y = 6;
			return temp;
		}

		private function __GuanYuanMingCePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/zhuangshitu.jpg";
			temp.x = 6;
			temp.y = 8;
			return temp;
		}

		private function __GuanYuanMingCePanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 485;
			temp.styleName = "ui/app/country/niupizhi/di.png";
			temp.width = 658;
			temp.x = 219;
			temp.y = 6;
			return temp;
		}

		private function __GuanYuanMingCePanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiaodi.png";
			temp.x = 220;
			temp.y = 8;
			return temp;
		}

		private function __GuanYuanMingCePanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 234;
			temp.y = 19;
			return temp;
		}

		private function __GuanYuanMingCePanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 424;
			temp.y = 19;
			return temp;
		}

		private function __GuanYuanMingCePanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 582;
			temp.y = 19;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 430;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 650;
			temp.x = 221;
			temp.y = 46;
			return temp;
		}

	}
}