package org.mokylin.skin.app.team
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamSearchListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labLevel:feathers.controls.Label;

		public var labManCount:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var labPlace:feathers.controls.Label;

		public var labType:feathers.controls.Label;

		public var labTypeLevel:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamSearchListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 20;
			this.width = 502;
			this.elementsContent = [__TeamSearchListSkin_UIAsset1_i(),labName_i(),labTypeLevel_i(),labType_i(),labLevel_i(),labPlace_i(),labManCount_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TeamSearchListSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 20;
			temp.styleName = "ui/common/kang/liebiao_di/liebiao_di.png";
			temp.width = 502;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLevel = temp;
			temp.name = "labLevel";
			temp.text = "等级限制";
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 64;
			temp.x = 311;
			temp.y = 2;
			return temp;
		}

		private function labManCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labManCount = temp;
			temp.name = "labManCount";
			temp.text = "空缺人数";
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 57;
			temp.x = 442;
			temp.y = 2;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.text = "队长";
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 147;
			temp.x = 3;
			temp.y = 2;
			return temp;
		}

		private function labPlace_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPlace = temp;
			temp.name = "labPlace";
			temp.text = "地区";
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 51;
			temp.x = 386;
			temp.y = 2;
			return temp;
		}

		private function labTypeLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTypeLevel = temp;
			temp.name = "labTypeLevel";
			temp.text = "刷新等级";
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 75;
			temp.x = 159;
			temp.y = 2;
			return temp;
		}

		private function labType_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labType = temp;
			temp.name = "labType";
			temp.text = "类型";
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 56;
			temp.x = 247;
			temp.y = 2;
			return temp;
		}

	}
}