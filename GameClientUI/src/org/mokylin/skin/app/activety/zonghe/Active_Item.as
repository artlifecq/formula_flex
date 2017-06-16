package org.mokylin.skin.app.activety.zonghe
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.activety.ActiveItemSelecteSkin;

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
		public var lbMsg:feathers.controls.Label;

		public var selectedBtn:feathers.controls.Radio;

		public var uiBg:feathers.controls.UIAsset;

		public var uiJinxing:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Active_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 71;
			this.width = 585;
			this.elementsContent = [uiBg_i(),selectedBtn_i(),uiName_i(),lbMsg_i(),uiJinxing_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.height = 39;
			temp.htmlText = "每周一，周三，周六，周日<br>21:00-21:30";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.leading = 7;
			temp.letterSpacing = 0;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 155;
			temp.y = 18;
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
			temp.styleName = "ui/big_bg/activety/zonghe/item/1.png";
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
			temp.styleName = "ui/common/jxz.png";
			temp.x = 347;
			temp.y = -2;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/activety/zonghe/active_name/1.png";
			temp.x = 22;
			temp.y = 19;
			return temp;
		}

	}
}