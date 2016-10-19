package org.mokylin.skin.app.familyWar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyWarDungeonInfoSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var family0:feathers.controls.Label;

		public var family1:feathers.controls.Label;

		public var jifen0:feathers.controls.Label;

		public var jifen1:feathers.controls.Label;

		public var time:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyWarDungeonInfoSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 125;
			this.elementsContent = [__FamilyWarDungeonInfoSkin_UIAsset1_i(),__FamilyWarDungeonInfoSkin_UIAsset2_i(),__FamilyWarDungeonInfoSkin_UIAsset3_i(),family1_i(),family0_i(),jifen0_i(),jifen1_i(),time_i(),__FamilyWarDungeonInfoSkin_Label1_i(),__FamilyWarDungeonInfoSkin_Label2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FamilyWarDungeonInfoSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "积分：";
			temp.color = 0x00E3FE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 132;
			temp.y = 34;
			return temp;
		}

		private function __FamilyWarDungeonInfoSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "积分：";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 792;
			temp.y = 34;
			return temp;
		}

		private function __FamilyWarDungeonInfoSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/familyWar/di.png";
			temp.y = 0;
			return temp;
		}

		private function __FamilyWarDungeonInfoSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 86;
			temp.styleName = "ui/app/familyWar/zhan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FamilyWarDungeonInfoSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/familyWar/guang_di.png";
			temp.x = 325;
			temp.y = 3;
			return temp;
		}

		private function family0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			family0 = temp;
			temp.name = "family0";
			temp.bold = false;
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "帮派1";
			temp.textAlign = "right";
			temp.color = 0x00E3FE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 171;
			temp.x = 229;
			temp.y = 34;
			return temp;
		}

		private function family1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			family1 = temp;
			temp.name = "family1";
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "帮派2";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 171;
			temp.x = 659;
			temp.y = 34;
			return temp;
		}

		private function jifen0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			jifen0 = temp;
			temp.name = "jifen0";
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "9999";
			temp.color = 0x00E3FE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 93;
			temp.x = 185;
			temp.y = 34;
			return temp;
		}

		private function jifen1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			jifen1 = temp;
			temp.name = "jifen1";
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "9999";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 152;
			temp.x = 836;
			temp.y = 35;
			return temp;
		}

		private function time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			time = temp;
			temp.name = "time";
			temp.fontSize = 16;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 221;
			temp.x = 421;
			temp.y = 85;
			return temp;
		}

	}
}