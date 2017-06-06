package org.mokylin.skin.app.zhanchang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhanchang.Head_Role_Left;
	import org.mokylin.skin.app.zhanchang.Head__Role_Right;
	import org.mokylin.skin.app.zhanchang.button.ButtonJiesu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZhangCheng_Scene extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnOver:feathers.controls.Button;

		public var skinLeft:feathers.controls.SkinnableContainer;

		public var skinRight:feathers.controls.SkinnableContainer;

		public var uiBuron1:feathers.controls.UIAsset;

		public var uiBuron2:feathers.controls.UIAsset;

		public var uiEnd1:feathers.controls.UIAsset;

		public var uiEnd2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhangCheng_Scene()
		{
			super();
			
			this.currentState = "normal";
			this.height = 512;
			this.width = 922;
			this.elementsContent = [__ZhangCheng_Scene_UIAsset1_i(),__ZhangCheng_Scene_UIAsset2_i(),uiBuron1_i(),uiEnd1_i(),uiEnd2_i(),uiBuron2_i(),btnOver_i(),skinLeft_i(),skinRight_i(),__ZhangCheng_Scene_UIAsset3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ZhangCheng_Scene_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ZhangCheng_Scene_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhanchang/scene_bg.jpg";
			temp.x = 5;
			temp.y = 5;
			return temp;
		}

		private function __ZhangCheng_Scene_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/scene/VS.png";
			temp.x = 395;
			temp.y = 57;
			return temp;
		}

		private function btnOver_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOver = temp;
			temp.name = "btnOver";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonJiesu;
			temp.color = 0xCFC6AE;
			temp.x = 345;
			temp.y = 447;
			return temp;
		}

		private function skinLeft_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinLeft = temp;
			temp.name = "skinLeft";
			temp.height = 91;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.Head_Role_Left()
			temp.skin = skin
			temp.width = 310;
			temp.x = 14;
			temp.y = 18;
			return temp;
		}

		private function skinRight_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRight = temp;
			temp.name = "skinRight";
			temp.height = 91;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.Head__Role_Right()
			temp.skin = skin
			temp.width = 310;
			temp.x = 568;
			temp.y = 18;
			return temp;
		}

		private function uiBuron1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBuron1 = temp;
			temp.name = "uiBuron1";
			temp.height = 10;
			temp.width = 10;
			temp.x = 59;
			temp.y = 376;
			return temp;
		}

		private function uiBuron2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBuron2 = temp;
			temp.name = "uiBuron2";
			temp.height = 10;
			temp.width = 10;
			temp.x = 839;
			temp.y = 376;
			return temp;
		}

		private function uiEnd1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiEnd1 = temp;
			temp.name = "uiEnd1";
			temp.height = 10;
			temp.width = 10;
			temp.x = 369;
			temp.y = 376;
			return temp;
		}

		private function uiEnd2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiEnd2 = temp;
			temp.name = "uiEnd2";
			temp.height = 10;
			temp.width = 10;
			temp.x = 539;
			temp.y = 376;
			return temp;
		}

	}
}