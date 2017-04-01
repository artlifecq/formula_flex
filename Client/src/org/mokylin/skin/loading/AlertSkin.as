package org.mokylin.skin.loading
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.loading.alert.button.ButtonSkin_close1;
	import org.mokylin.skin.loading.alert.button.ButtonSkin_yellow;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class AlertSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCancel:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var lbTip:feathers.controls.Label;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AlertSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__AlertSkin_UIAsset1_i(),btnOk_i(),btnCancel_i(),__AlertSkin_UIAsset2_i(),btnClose_i(),lbTip_i(),title_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __AlertSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 210;
			temp.styleName = "ui/loading/alert/backgound/erji_kuang.png";
			temp.width = 375;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __AlertSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 104;
			temp.styleName = "ui/loading/alert/kang/neikuang_2.png";
			temp.width = 352;
			temp.x = 12;
			temp.y = 40;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "取消";
			temp.styleClass = org.mokylin.skin.loading.alert.button.ButtonSkin_yellow;
			temp.color = 0xE1D4A9;
			temp.width = 80;
			temp.x = 210;
			temp.y = 156;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.loading.alert.button.ButtonSkin_close1;
			temp.x = 341;
			temp.y = 7;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "确定";
			temp.styleClass = org.mokylin.skin.loading.alert.button.ButtonSkin_yellow;
			temp.color = 0xE1D4A9;
			temp.width = 80;
			temp.x = 95;
			temp.y = 156;
			return temp;
		}

		private function lbTip_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTip = temp;
			temp.name = "lbTip";
			temp.height = 96;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "提示内容";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.verticalAlign = "middle";
			temp.width = 330;
			temp.x = 22;
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
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 240;
			temp.x = 68;
			temp.y = 12;
			return temp;
		}

	}
}