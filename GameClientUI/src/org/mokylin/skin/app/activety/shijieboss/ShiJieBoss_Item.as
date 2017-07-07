package org.mokylin.skin.app.activety.shijieboss
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.activety.ActiveItemSelecteSkin;
	import org.mokylin.skin.app.activety.button.ButtonJinru;
	import org.mokylin.skin.app.activety.mc.UIMovieClipActiveEffect;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShiJieBoss_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnEnter:feathers.controls.Button;

		public var lbLevel:feathers.controls.Label;

		public var lbMsg1:feathers.controls.Label;

		public var lbMsg2:feathers.controls.Label;

		public var mcEffect:feathers.controls.UIMovieClip;

		public var selectedBtn:feathers.controls.Radio;

		public var uiBg:feathers.controls.UIAsset;

		public var uiJinxing:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShiJieBoss_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 71;
			this.width = 585;
			this.elementsContent = [uiBg_i(),mcEffect_i(),selectedBtn_i(),uiName_i(),lbMsg1_i(),lbMsg2_i(),uiJinxing_i(),btnEnter_i(),lbLevel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnEnter_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnEnter = temp;
			temp.name = "btnEnter";
			temp.styleClass = org.mokylin.skin.app.activety.button.ButtonJinru;
			temp.x = 477;
			temp.y = 19;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.text = "(等级需求：70级)";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 307;
			temp.y = 18;
			return temp;
		}

		private function lbMsg1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg1 = temp;
			temp.name = "lbMsg1";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.leading = 7;
			temp.letterSpacing = 0;
			temp.text = "【16-20级】 马贼首领";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 155;
			temp.y = 18;
			return temp;
		}

		private function lbMsg2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg2 = temp;
			temp.name = "lbMsg2";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.leading = 7;
			temp.letterSpacing = 0;
			temp.text = "21:00-21:30";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 155;
			temp.y = 39;
			return temp;
		}

		private function mcEffect_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mcEffect = temp;
			temp.name = "mcEffect";
			temp.autoPlay = false;
			temp.blendMode = "add";
			temp.frameRate = 10;
			temp.height = 83;
			temp.styleClass = org.mokylin.skin.app.activety.mc.UIMovieClipActiveEffect;
			temp.width = 590;
			temp.x = -4;
			temp.y = 0;
			return temp;
		}

		private function selectedBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			selectedBtn = temp;
			temp.name = "selectedBtn";
			temp.groupName = "radioGroup1";
			temp.height = 71;
			temp.styleClass = org.mokylin.skin.app.activety.ActiveItemSelecteSkin;
			temp.width = 585;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBg = temp;
			temp.name = "uiBg";
			temp.styleName = "ui/big_bg/activety/item/changchengcanyuan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiJinxing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJinxing = temp;
			temp.name = "uiJinxing";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/yijisha2.png";
			temp.x = 347;
			temp.y = 16;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/activety/zonghe/active_name/dianfengduijue.png";
			temp.x = 22;
			temp.y = 19;
			return temp;
		}

	}
}