package org.mokylin.skin.app.banghui.button
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Button_GeRen extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __Button_GeRen_UIAsset1:feathers.controls.UIAsset;

		public var __Button_GeRen_UIAsset2:feathers.controls.UIAsset;

		public var __Button_GeRen_UIAsset3:feathers.controls.UIAsset;

		public var __Button_GeRen_UIAsset4:feathers.controls.UIAsset;

		public var __Button_GeRen_UIAsset5:feathers.controls.UIAsset;

		public var __Button_GeRen_UIAsset6:feathers.controls.UIAsset;

		public var __Button_GeRen_UIAsset7:feathers.controls.UIAsset;

		public var __Button_GeRen_UIAsset8:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Button_GeRen()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			__Button_GeRen_UIAsset1_i();
			__Button_GeRen_UIAsset2_i();
			__Button_GeRen_UIAsset3_i();
			__Button_GeRen_UIAsset4_i();
			__Button_GeRen_UIAsset5_i();
			__Button_GeRen_UIAsset6_i();
			__Button_GeRen_UIAsset7_i();
			__Button_GeRen_UIAsset8_i();
			
			
			states = {
			};
			skinNames={"down":"ui/app/banghui/button/yeqian/down.png,ui/app/banghui/button/jineng1/down.png",
			"downAndSelected":"ui/app/banghui/button/yeqian/down.png,ui/app/banghui/button/jineng1/down.png",
			"hover":"ui/app/banghui/button/yeqian/over.png,ui/app/banghui/button/jineng1/over.png",
			"hoverAndSelected":"ui/app/banghui/button/yeqian/over.png,ui/app/banghui/button/jineng1/over.png",
			"up":"ui/app/banghui/button/yeqian/up.png,ui/app/banghui/button/jineng1/up.png",
			"upAndSelected":"ui/app/banghui/button/yeqian/over.png,ui/app/banghui/button/jineng1/over.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Button_GeRen_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_GeRen_UIAsset1 = temp;
			temp.styleName = "ui/app/banghui/button/yeqian/up.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Button_GeRen_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_GeRen_UIAsset2 = temp;
			temp.styleName = "ui/app/banghui/button/yeqian/over.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Button_GeRen_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_GeRen_UIAsset3 = temp;
			temp.styleName = "ui/app/banghui/button/yeqian/down.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Button_GeRen_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_GeRen_UIAsset4 = temp;
			temp.styleName = "ui/app/banghui/button/yeqian/over.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Button_GeRen_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_GeRen_UIAsset5 = temp;
			temp.styleName = "ui/app/banghui/button/jineng1/up.png";
			temp.x = 32;
			temp.y = 13;
			return temp;
		}

		private function __Button_GeRen_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_GeRen_UIAsset6 = temp;
			temp.styleName = "ui/app/banghui/button/jineng1/over.png";
			temp.x = 32;
			temp.y = 13;
			return temp;
		}

		private function __Button_GeRen_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_GeRen_UIAsset7 = temp;
			temp.styleName = "ui/app/banghui/button/jineng1/down.png";
			temp.x = 32;
			temp.y = 13;
			return temp;
		}

		private function __Button_GeRen_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_GeRen_UIAsset8 = temp;
			temp.styleName = "ui/app/banghui/button/jineng1/over.png";
			temp.x = 32;
			temp.y = 13;
			return temp;
		}

	}
}