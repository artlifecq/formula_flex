package org.mokylin.skin.app.familyWar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyWarMonsterSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bar:feathers.controls.ProgressBar;

		public var bigNull:feathers.controls.UIAsset;

		public var family:feathers.controls.Label;

		public var smallNull:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyWarMonsterSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bar_i(),bigNull_i(),smallNull_i(),family_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			bar = temp;
			temp.name = "bar";
			temp.height = 56;
			temp.maximum = 100;
			temp.progressMode = "mask";
			temp.value = 100;
			temp.width = 56;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bigNull_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bigNull = temp;
			temp.name = "bigNull";
			temp.styleName = "ui/app/familyWar/hui_56.png";
			temp.y = 0;
			return temp;
		}

		private function family_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			family = temp;
			temp.name = "family";
			temp.fontSize = 14;
			temp.text = "王";
			temp.textAlign = "center";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 23;
			temp.x = 25;
			temp.y = 31;
			return temp;
		}

		private function smallNull_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			smallNull = temp;
			temp.name = "smallNull";
			temp.styleName = "ui/app/familyWar/hui_48.png";
			temp.x = 8;
			temp.y = 8;
			return temp;
		}

	}
}