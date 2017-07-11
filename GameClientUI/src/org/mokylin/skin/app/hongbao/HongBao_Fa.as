package org.mokylin.skin.app.hongbao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.hongbao.button.ButtonCha;
	import org.mokylin.skin.app.hongbao.button.ButtonFahongbao;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putongMax;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HongBao_Fa extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnFa:feathers.controls.Button;

		public var btn_all:feathers.controls.Button;

		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var faBg:feathers.controls.UIAsset;

		public var fbg:feathers.controls.UIAsset;

		public var grpFa:feathers.controls.Group;

		public var grpFlip:feathers.controls.Group;

		public var lbBuyNum:feathers.controls.Label;

		public var lbItem:feathers.controls.Label;

		public var uiDown:feathers.controls.UIAsset;

		public var uiIcon:feathers.controls.UIAsset;

		public var uiUp:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HongBao_Fa()
		{
			super();
			
			this.currentState = "normal";
			this.height = 502;
			this.width = 271;
			this.elementsContent = [__HongBao_Fa_UIAsset1_i(),uiDown_i(),uiUp_i(),uiIcon_i(),btnFa_i(),grpFa_i(),grpFlip_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HongBao_Fa_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "累计充值<font color='#00ff33'>200</font>元宝，可派发一个红包";
			temp.leading = 10;
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 231;
			temp.x = 2;
			temp.y = 30;
			return temp;
		}

		private function __HongBao_Fa_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.leading = 10;
			temp.text = "当前可派发红包次数：";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 27;
			temp.y = 3;
			return temp;
		}

		private function __HongBao_Fa_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hongbao/bg.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.app.hongbao.button.ButtonCha;
			temp.x = 237;
			temp.y = 5;
			return temp;
		}

		private function btnFa_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFa = temp;
			temp.name = "btnFa";
			temp.styleClass = org.mokylin.skin.app.hongbao.button.ButtonFahongbao;
			temp.x = 80;
			temp.y = 231;
			return temp;
		}

		private function btn_all_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_all = temp;
			temp.name = "btn_all";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putongMax;
			temp.x = 104;
			temp.y = 0;
			return temp;
		}

		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 81;
			temp.y = 0;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function faBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			faBg = temp;
			temp.name = "faBg";
			temp.height = 49;
			temp.styleName = "ui/app/hongbao/dibanhuitiao.png";
			temp.width = 235;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function fbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fbg = temp;
			temp.name = "fbg";
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 57;
			temp.x = 23;
			temp.y = 0;
			return temp;
		}

		private function grpFa_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFa = temp;
			temp.name = "grpFa";
			temp.x = 18;
			temp.y = 179;
			temp.elementsContent = [faBg_i(),__HongBao_Fa_Label1_i(),lbItem_i(),__HongBao_Fa_Label2_i()];
			return temp;
		}

		private function grpFlip_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFlip = temp;
			temp.name = "grpFlip";
			temp.x = 59;
			temp.y = 401;
			temp.elementsContent = [btn_min_i(),btn_max_i(),btn_all_i(),fbg_i(),lbBuyNum_i()];
			return temp;
		}

		private function lbBuyNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBuyNum = temp;
			temp.name = "lbBuyNum";
			temp.text = "1000";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 53;
			temp.x = 23;
			temp.y = 2;
			return temp;
		}

		private function lbItem_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbItem = temp;
			temp.name = "lbItem";
			temp.leading = 10;
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0x41FF65;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 171;
			temp.y = 4;
			return temp;
		}

		private function uiDown_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiDown = temp;
			temp.name = "uiDown";
			temp.styleName = "ui/app/hongbao/xia.png";
			temp.x = 2;
			temp.y = 227;
			return temp;
		}

		private function uiIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiIcon = temp;
			temp.name = "uiIcon";
			temp.styleName = "ui/app/hongbao/jubaopen.png";
			temp.x = 38;
			temp.y = 30;
			return temp;
		}

		private function uiUp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUp = temp;
			temp.name = "uiUp";
			temp.styleName = "ui/app/hongbao/shang.png";
			temp.x = 2;
			temp.y = 2;
			return temp;
		}

	}
}