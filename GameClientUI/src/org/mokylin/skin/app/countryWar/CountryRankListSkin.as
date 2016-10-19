package org.mokylin.skin.app.countryWar
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryRankListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labKillCount:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var labRank:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryRankListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 20;
			this.width = 445;
			this.elementsContent = [labName_i(),labRank_i(),__CountryRankListSkin_Label1_i(),labKillCount_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CountryRankListSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "击杀人数";
			temp.color = 0xDC1D03;
			temp.width = 56;
			temp.x = 302;
			temp.y = 2;
			return temp;
		}

		private function labKillCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labKillCount = temp;
			temp.name = "labKillCount";
			temp.height = 16;
			temp.text = "1212";
			temp.color = 0xDC1D03;
			temp.width = 73;
			temp.x = 365;
			temp.y = 2;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.text = "名字要有七个字";
			temp.color = 0xE56A10;
			temp.width = 122;
			temp.x = 143;
			temp.y = 2;
			return temp;
		}

		private function labRank_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labRank = temp;
			temp.name = "labRank";
			temp.text = "第一名";
			temp.color = 0xCABB67;
			temp.width = 67;
			temp.x = 14;
			temp.y = 2;
			return temp;
		}

	}
}