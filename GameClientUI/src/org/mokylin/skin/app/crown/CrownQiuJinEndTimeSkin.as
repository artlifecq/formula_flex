package org.mokylin.skin.app.crown
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
	public class CrownQiuJinEndTimeSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var time:feathers.controls.Label;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CrownQiuJinEndTimeSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__CrownQiuJinEndTimeSkin_UIAsset1_i(),__CrownQiuJinEndTimeSkin_UIAsset2_i(),__CrownQiuJinEndTimeSkin_UIAsset3_i(),title_i(),time_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CrownQiuJinEndTimeSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 124;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 371;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CrownQiuJinEndTimeSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 346;
			temp.x = 12;
			temp.y = 8;
			return temp;
		}

		private function __CrownQiuJinEndTimeSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 42;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 327;
			temp.x = 23;
			temp.y = 55;
			return temp;
		}

		private function time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			time = temp;
			temp.name = "time";
			temp.height = 24;
			temp.fontSize = 18;
			temp.text = "囚禁时间剩余: 15:00";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 301;
			temp.x = 34;
			temp.y = 64;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.height = 24;
			temp.fontSize = 18;
			temp.text = "囚  禁";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 175;
			temp.x = 104;
			temp.y = 8;
			return temp;
		}

	}
}