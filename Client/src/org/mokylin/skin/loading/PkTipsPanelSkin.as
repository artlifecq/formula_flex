package org.mokylin.skin.loading
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.loading.alert.button.ButtonSkin_red;
	import org.mokylin.skin.loading.alert.button.ButtonSkin_yellow;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PkTipsPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnExit:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var lbTip:feathers.controls.Label;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PkTipsPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 210;
			this.width = 470;
			this.elementsContent = [__PkTipsPanelSkin_UIAsset1_i(),btnOk_i(),btnExit_i(),__PkTipsPanelSkin_UIAsset2_i(),lbTip_i(),title_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PkTipsPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 210;
			temp.styleName = "ui/loading/alert/backgound/erji_kuang.png";
			temp.width = 471;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PkTipsPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 104;
			temp.styleName = "ui/loading/alert/kang/neikuang_2.png";
			temp.width = 448;
			temp.x = 12;
			temp.y = 40;
			return temp;
		}

		private function btnExit_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnExit = temp;
			temp.name = "btnExit";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "退出游戏";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.loading.alert.button.ButtonSkin_yellow;
			temp.color = 0xE1D4A9;
			temp.width = 90;
			temp.x = 326;
			temp.y = 154;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "已 阅 读 并 同 意 声 明";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.loading.alert.button.ButtonSkin_red;
			temp.color = 0xE1D4A9;
			temp.width = 211;
			temp.x = 62;
			temp.y = 154;
			return temp;
		}

		private function lbTip_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTip = temp;
			temp.name = "lbTip";
			temp.height = 91;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "《寻秦记》";
			temp.textAlign = "left";
			temp.color = 0xEAA849;
			temp.verticalAlign = "middle";
			temp.width = 416;
			temp.x = 26;
			temp.y = 42;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.bold = false;
			temp.height = 26;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "补充协议";
			temp.textAlign = "center";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 240;
			temp.x = 114;
			temp.y = 12;
			return temp;
		}

	}
}