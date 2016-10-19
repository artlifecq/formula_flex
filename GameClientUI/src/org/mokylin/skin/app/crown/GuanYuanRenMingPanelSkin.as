package org.mokylin.skin.app.crown
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
	public class GuanYuanRenMingPanelSkin extends feathers.controls.StateSkin
	{
		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuanYuanRenMingPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__GuanYuanRenMingPanelSkin_UIAsset1_i(),__GuanYuanRenMingPanelSkin_UIAsset2_i(),__GuanYuanRenMingPanelSkin_UIAsset3_i(),__GuanYuanRenMingPanelSkin_UIAsset4_i(),__GuanYuanRenMingPanelSkin_UIAsset5_i(),__GuanYuanRenMingPanelSkin_UIAsset6_i(),__GuanYuanRenMingPanelSkin_UIAsset7_i(),__GuanYuanRenMingPanelSkin_Label1_i(),__GuanYuanRenMingPanelSkin_Label2_i(),__GuanYuanRenMingPanelSkin_Label3_i(),__GuanYuanRenMingPanelSkin_Label4_i(),list_i(),__GuanYuanRenMingPanelSkin_Label5_i(),__GuanYuanRenMingPanelSkin_UIAsset8_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuanYuanRenMingPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "官职";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 118;
			temp.x = 219;
			temp.y = 23;
			return temp;
		}

		private function __GuanYuanRenMingPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "玩家名称";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 139;
			temp.x = 338;
			temp.y = 23;
			return temp;
		}

		private function __GuanYuanRenMingPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "所在家族";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 135;
			temp.x = 478;
			temp.y = 23;
			return temp;
		}

		private function __GuanYuanRenMingPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "在线状态";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 127;
			temp.x = 617;
			temp.y = 23;
			return temp;
		}

		private function __GuanYuanRenMingPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "操作";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 110;
			temp.x = 748;
			temp.y = 23;
			return temp;
		}

		private function __GuanYuanRenMingPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/neikuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __GuanYuanRenMingPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/di.png";
			temp.x = 219;
			temp.y = 6;
			return temp;
		}

		private function __GuanYuanRenMingPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiaodi.png";
			temp.x = 218;
			temp.y = 14;
			return temp;
		}

		private function __GuanYuanRenMingPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 201;
			temp.y = 24;
			return temp;
		}

		private function __GuanYuanRenMingPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 340;
			temp.y = 24;
			return temp;
		}

		private function __GuanYuanRenMingPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 480;
			temp.y = 24;
			return temp;
		}

		private function __GuanYuanRenMingPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 610;
			temp.y = 24;
			return temp;
		}

		private function __GuanYuanRenMingPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/qun_chen_chao_bai.jpg";
			temp.x = 5;
			temp.y = 5;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 440;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 654;
			temp.x = 220;
			temp.y = 46;
			return temp;
		}

	}
}