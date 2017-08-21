package org.mokylin.skin.app.activety.zonghe
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.activety.ActiveItemSelecteSkin;
	import org.mokylin.skin.app.activety.mc.UIMovieClipActiveEffect;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Active_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbLevel:feathers.controls.Label;

		public var lbMsg:feathers.controls.Label;

		public var lt_icon:feathers.controls.UIAsset;

		public var mcEffect:feathers.controls.UIMovieClip;

		public var selectedBtn:feathers.controls.Radio;

		public var state_icon:feathers.controls.UIAsset;

		public var uiBg:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Active_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 71;
			this.width = 516;
			this.elementsContent = [uiBg_i(),mcEffect_i(),selectedBtn_i(),uiName_i(),lbMsg_i(),state_icon_i(),lbLevel_i(),lt_icon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.text = "(等级需求：70级)";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 291;
			temp.y = 16;
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.height = 39;
			temp.htmlText = "活动时间21:00-21:30<br>每周一，周三，周六，周日";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.leading = 7;
			temp.letterSpacing = 0;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 155;
			temp.y = 15;
			return temp;
		}

		private function lt_icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lt_icon = temp;
			temp.name = "lt_icon";
			temp.styleName = "ui/common/kuafu.png";
			temp.x = 2;
			temp.y = 4;
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
			temp.height = 71;
			temp.styleClass = org.mokylin.skin.app.activety.mc.UIMovieClipActiveEffect;
			temp.width = 516;
			temp.x = 0;
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
			temp.width = 516;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function state_icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			state_icon = temp;
			temp.name = "state_icon";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/activety/jinxingzhong2.png";
			temp.x = 410;
			temp.y = 21;
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

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/activety/zonghe/active_name/dianfengduijue.png";
			temp.x = 22;
			temp.y = 24;
			return temp;
		}

	}
}