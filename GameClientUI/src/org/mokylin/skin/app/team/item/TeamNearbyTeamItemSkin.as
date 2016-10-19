package org.mokylin.skin.app.team.item
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
	public class TeamNearbyTeamItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgMax:feathers.controls.UIAsset;

		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var labCaptainLevel:feathers.controls.Label;

		public var labCaptainName:feathers.controls.Label;

		public var labMeanLevel:feathers.controls.Label;

		public var labTeamNumber:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamNearbyTeamItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.width = 835;
			this.elementsContent = [itemBg_i(),itemSelected_i(),labCaptainName_i(),labCaptainLevel_i(),labMeanLevel_i(),labTeamNumber_i(),imgMax_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgMax_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgMax = temp;
			temp.name = "imgMax";
			temp.height = 27;
			temp.styleName = "ui/common/icon/man.png";
			temp.width = 28;
			temp.x = 750;
			temp.y = 1;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 28;
			temp.styleName = "ui/app/country/niupizhi/lieditiao_xiao.png";
			temp.width = 815;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function itemSelected_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemSelected = temp;
			temp.name = "itemSelected";
			temp.height = 28;
			temp.styleName = "ui/common/liebiao/select.png";
			temp.width = 815;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labCaptainLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCaptainLevel = temp;
			temp.name = "labCaptainLevel";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "12";
			temp.textAlign = "center";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 209;
			temp.x = 209;
			temp.y = 6;
			return temp;
		}

		private function labCaptainName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCaptainName = temp;
			temp.name = "labCaptainName";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "玩家名称七个字";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 209;
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function labMeanLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMeanLevel = temp;
			temp.name = "labMeanLevel";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "12";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 209;
			temp.x = 418;
			temp.y = 6;
			return temp;
		}

		private function labTeamNumber_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTeamNumber = temp;
			temp.name = "labTeamNumber";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "1/5";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 189;
			temp.x = 627;
			temp.y = 6;
			return temp;
		}

	}
}