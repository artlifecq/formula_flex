package org.mokylin.skin.app.zhanchang.jingjichang
{
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber2;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber2_2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PaiMingItem extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var gRank:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var imgHat:feathers.controls.UIAsset;

		public var numLeve2:feathers.controls.UINumber;

		public var numLevel:feathers.controls.UINumber;

		public var uiL1:feathers.controls.UIAsset;

		public var uiL2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiMingItem()
		{
			super();
			
			this.currentState = "normal";
			this.height = 74;
			this.width = 483;
			this.elementsContent = [__PaiMingItem_UIAsset1_i(),imgHat_i(),gRank_i(),icon1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PaiMingItem_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jingjichang/tiaokuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function gRank_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gRank = temp;
			temp.name = "gRank";
			temp.x = 36;
			temp.y = 27;
			temp.elementsContent = [uiL1_i(),uiL2_i(),numLevel_i(),numLeve2_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 156;
			temp.y = 8;
			return temp;
		}

		private function imgHat_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgHat = temp;
			temp.name = "imgHat";
			temp.styleName = "ui/app/zhanchang/jingjichang/pai1.png";
			temp.x = 37;
			temp.y = 2;
			return temp;
		}

		private function numLeve2_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numLeve2 = temp;
			temp.name = "numLeve2";
			temp.height = 25;
			temp.label = "5";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber2;
			temp.width = 14;
			temp.x = 27;
			temp.y = 4;
			return temp;
		}

		private function numLevel_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numLevel = temp;
			temp.name = "numLevel";
			temp.height = 25;
			temp.label = "5";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber2_2;
			temp.width = 19;
			temp.x = 25;
			temp.y = 2;
			return temp;
		}

		private function uiL1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiL1 = temp;
			temp.name = "uiL1";
			temp.styleName = "ui/app/zhanchang/jingjichang/di.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiL2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiL2 = temp;
			temp.name = "uiL2";
			temp.styleName = "ui/app/zhanchang/jingjichang/ming.png";
			temp.x = 39;
			temp.y = 0;
			return temp;
		}

	}
}