package org.mokylin.skin.app.zhanchang
{
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.Head_Role_Left;
	import org.mokylin.skin.app.zhanchang.Head__Role_Right;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberNumTime;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class VS_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grpVS:feathers.controls.Group;

		public var skinLeft:feathers.controls.SkinnableContainer;

		public var skinRight:feathers.controls.SkinnableContainer;

		public var uiTime:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function VS_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [skinLeft_i(),skinRight_i(),grpVS_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __VS_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/scene/VS.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grpVS_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpVS = temp;
			temp.name = "grpVS";
			temp.x = 395;
			temp.y = 59;
			temp.elementsContent = [__VS_Skin_UIAsset1_i(),uiTime_i()];
			return temp;
		}

		private function skinLeft_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinLeft = temp;
			temp.name = "skinLeft";
			temp.height = 88;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.Head_Role_Left()
			temp.skin = skin
			temp.width = 341;
			temp.x = 7;
			temp.y = 33;
			return temp;
		}

		private function skinRight_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRight = temp;
			temp.name = "skinRight";
			temp.height = 88;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.Head__Role_Right()
			temp.skin = skin
			temp.width = 341;
			temp.x = 575;
			temp.y = 33;
			return temp;
		}

		private function uiTime_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			uiTime = temp;
			temp.name = "uiTime";
			temp.height = 25;
			temp.label = "00x01x52";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumTime;
			temp.width = 123;
			temp.x = 5;
			temp.y = 56;
			return temp;
		}

	}
}