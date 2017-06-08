package org.mokylin.skin.app.activety
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TestToggleBtnSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __TestToggleBtnSkin_UIAsset1:feathers.controls.UIAsset;

		public var __TestToggleBtnSkin_UIAsset2:feathers.controls.UIAsset;

		public var __TestToggleBtnSkin_UIAsset3:feathers.controls.UIAsset;

		public var __TestToggleBtnSkin_UIAsset4:feathers.controls.UIAsset;

		public var __TestToggleBtnSkin_UIAsset5:feathers.controls.UIAsset;

		public var __TestToggleBtnSkin_UIAsset6:feathers.controls.UIAsset;

		public var __TestToggleBtnSkin_UIAsset7:feathers.controls.UIAsset;

		public var __TestToggleBtnSkin_UIAsset8:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TestToggleBtnSkin()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			__TestToggleBtnSkin_UIAsset1_i();
			__TestToggleBtnSkin_UIAsset2_i();
			__TestToggleBtnSkin_UIAsset3_i();
			__TestToggleBtnSkin_UIAsset4_i();
			__TestToggleBtnSkin_UIAsset5_i();
			__TestToggleBtnSkin_UIAsset6_i();
			__TestToggleBtnSkin_UIAsset7_i();
			__TestToggleBtnSkin_UIAsset8_i();
			
			
			states = {
			};
			skinNames={"down":"ui/app/activety/btn_juese/down.png,ui/app/activety/btn_juese/text_down.png",
			"downAndSelected":"ui/app/activety/btn_juese/down.png,ui/app/activety/btn_juese/text_down.png",
			"hover":"ui/app/activety/btn_juese/over.png,ui/app/activety/btn_juese/text_over.png",
			"hoverAndSelected":"ui/app/activety/btn_juese/over.png,ui/app/activety/btn_juese/text_over.png",
			"up":"ui/app/activety/btn_juese/up.png,ui/app/activety/btn_juese/text_up.png",
			"upAndSelected":"ui/app/activety/btn_juese/select.png,ui/app/activety/btn_juese/text_select.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TestToggleBtnSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TestToggleBtnSkin_UIAsset1 = temp;
			temp.styleName = "ui/app/activety/btn_juese/up.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TestToggleBtnSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TestToggleBtnSkin_UIAsset2 = temp;
			temp.styleName = "ui/app/activety/btn_juese/over.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TestToggleBtnSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TestToggleBtnSkin_UIAsset3 = temp;
			temp.styleName = "ui/app/activety/btn_juese/down.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TestToggleBtnSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TestToggleBtnSkin_UIAsset4 = temp;
			temp.styleName = "ui/app/activety/btn_juese/select.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TestToggleBtnSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TestToggleBtnSkin_UIAsset5 = temp;
			temp.styleName = "ui/app/activety/btn_juese/text_up.png";
			temp.x = 35;
			temp.y = 10;
			return temp;
		}

		private function __TestToggleBtnSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TestToggleBtnSkin_UIAsset6 = temp;
			temp.styleName = "ui/app/activety/btn_juese/text_over.png";
			temp.x = 35;
			temp.y = 10;
			return temp;
		}

		private function __TestToggleBtnSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TestToggleBtnSkin_UIAsset7 = temp;
			temp.styleName = "ui/app/activety/btn_juese/text_down.png";
			temp.x = 35;
			temp.y = 10;
			return temp;
		}

		private function __TestToggleBtnSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TestToggleBtnSkin_UIAsset8 = temp;
			temp.styleName = "ui/app/activety/btn_juese/text_select.png";
			temp.x = 35;
			temp.y = 10;
			return temp;
		}

	}
}