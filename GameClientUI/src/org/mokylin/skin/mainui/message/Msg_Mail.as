package org.mokylin.skin.mainui.message
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close2;
	import org.mokylin.skin.mainui.message.button.ButtonMail;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Msg_Mail extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnCont:feathers.controls.Button;

		public var lbNum:feathers.controls.Label;

		public var numBg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Msg_Mail()
		{
			super();
			
			this.currentState = "normal";
			this.height = 50;
			this.width = 50;
			this.elementsContent = [btnCont_i(),btnClose_i(),numBg_i(),lbNum_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close2;
			temp.x = 33;
			temp.y = 0;
			return temp;
		}

		private function btnCont_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCont = temp;
			temp.name = "btnCont";
			temp.styleClass = org.mokylin.skin.mainui.message.button.ButtonMail;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.fontSize = 12;
			temp.text = "12";
			temp.textAlign = "center";
			temp.color = 0xEFD872;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 1;
			temp.y = 26;
			return temp;
		}

		private function numBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			numBg = temp;
			temp.name = "numBg";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.scaleX = -1;
			temp.styleName = "ui/common/tubiao/qipao.png";
			temp.x = 19;
			temp.y = 25;
			return temp;
		}

	}
}