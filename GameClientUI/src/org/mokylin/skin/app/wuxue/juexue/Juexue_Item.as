package org.mokylin.skin.app.wuxue.juexue
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.wuxue.juexue.SelectBtn;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Juexue_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_over:feathers.controls.Radio;

		public var icons:feathers.controls.UIAsset;

		public var lb_weijihuo:feathers.controls.Label;

		public var qiyong:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Juexue_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 106;
			this.width = 94;
			this.elementsContent = [btn_over_i(),icons_i(),lb_weijihuo_i(),qiyong_i(),uiName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_over_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_over = temp;
			temp.name = "btn_over";
			temp.height = 82;
			temp.styleClass = org.mokylin.skin.app.wuxue.juexue.SelectBtn;
			temp.width = 85;
			temp.x = 0;
			temp.y = 7;
			return temp;
		}

		private function icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icons = temp;
			temp.name = "icons";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/tips/icon/bingfengsudong.png";
			temp.x = 18;
			temp.y = 16;
			return temp;
		}

		private function lb_weijihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_weijihuo = temp;
			temp.name = "lb_weijihuo";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "未激活";
			temp.textAlign = "center";
			temp.color = 0x6F6F6D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreeni"];
			temp.width = 50;
			temp.x = 18;
			temp.y = 69;
			return temp;
		}

		private function qiyong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qiyong = temp;
			temp.name = "qiyong";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/wuxue/juexue/qiyong.png";
			temp.x = 56;
			temp.y = 0;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/common/tips/name/bingfengsudong.png";
			temp.x = 11;
			temp.y = 83;
			return temp;
		}

	}
}