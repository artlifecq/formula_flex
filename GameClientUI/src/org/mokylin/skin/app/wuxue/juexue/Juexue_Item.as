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

		public var jihuo:feathers.controls.UIAsset;

		public var lb_name:feathers.controls.Label;

		public var lb_weijihuo:feathers.controls.Label;

		public var qiyong:feathers.controls.UIAsset;

		public var weijihuo:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Juexue_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 96;
			this.width = 87;
			this.elementsContent = [btn_over_i(),weijihuo_i(),jihuo_i(),lb_weijihuo_i(),lb_name_i(),qiyong_i()];
			
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
			temp.styleClass = org.mokylin.skin.app.wuxue.juexue.SelectBtn;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function jihuo_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jihuo = temp;
			temp.name = "jihuo";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/wuxue/juexue/liang.png";
			temp.x = 18;
			temp.y = 10;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "飞升九天";
			temp.textAlign = "center";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreeni"];
			temp.width = 73;
			temp.x = 7;
			temp.y = 78;
			return temp;
		}

		private function lb_weijihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_weijihuo = temp;
			temp.name = "lb_weijihuo";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "未激活";
			temp.textAlign = "center";
			temp.color = 0x6F6F6D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreeni"];
			temp.width = 50;
			temp.x = 20;
			temp.y = 60;
			return temp;
		}

		private function qiyong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qiyong = temp;
			temp.name = "qiyong";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/wuxue/juexue/qiyong.png";
			temp.x = 59;
			temp.y = 0;
			return temp;
		}

		private function weijihuo_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			weijihuo = temp;
			temp.name = "weijihuo";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/wuxue/juexue/hui.png";
			temp.x = 18;
			temp.y = 9;
			return temp;
		}

	}
}