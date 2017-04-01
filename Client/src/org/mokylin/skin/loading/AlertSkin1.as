package org.mokylin.skin.loading
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.loading.ButtonSkin_closeSkin;
	import org.mokylin.skin.loading.ButtonSkin_greenSkin;
	import org.mokylin.skin.loading.TextInputSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class AlertSkin1 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCancel:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var lbTip:feathers.controls.TextArea;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AlertSkin1()
		{
			super();
			
			this.currentState = "normal";
			this.height = 269;
			this.width = 418;
			this.elementsContent = [__AlertSkin1_UIAsset1_i(),btnOk_i(),btnCancel_i(),btnClose_i(),lbTip_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __AlertSkin1_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 269;
			temp.styleName = "ui/loading/alert/tyzk.png";
			temp.width = 418;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.label = "取消";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.loading.ButtonSkin_greenSkin);
			temp.width = 79;
			temp.x = 226;
			temp.y = 227;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.loading.ButtonSkin_closeSkin);
			temp.x = 386;
			temp.y = 7;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.label = "确定";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.loading.ButtonSkin_greenSkin);
			temp.width = 90;
			temp.x = 103;
			temp.y = 227;
			return temp;
		}

		private function lbTip_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			lbTip = temp;
			temp.name = "lbTip";
			temp.isEditable = false;
			temp.height = 130;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.loading.TextInputSkin);
			temp.text = "dfasdfasdf";
			temp.color = 0xFFFFFF;
			temp.width = 364;
			temp.x = 30;
			temp.y = 45;
			return temp;
		}

	}
}