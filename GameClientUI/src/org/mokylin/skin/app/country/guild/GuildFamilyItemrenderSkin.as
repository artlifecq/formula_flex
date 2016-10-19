package org.mokylin.skin.app.country.guild
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
	public class GuildFamilyItemrenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var countryOffice:feathers.controls.Label;

		public var familyName:feathers.controls.Label;

		public var familyOffice:feathers.controls.Label;

		public var fightAmount:feathers.controls.Label;

		public var gongxian:feathers.controls.Label;

		public var level:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildFamilyItemrenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 25;
			this.elementsContent = [bg_i(),familyName_i(),level_i(),gongxian_i(),fightAmount_i(),familyOffice_i(),countryOffice_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 27;
			temp.styleName = "ui/common/kang/liebiao_di/liebiao_di.png";
			temp.width = 608;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function countryOffice_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			countryOffice = temp;
			temp.name = "countryOffice";
			temp.text = "官职";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 107;
			temp.x = 480;
			temp.y = 5;
			return temp;
		}

		private function familyName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			familyName = temp;
			temp.name = "familyName";
			temp.text = "家族名称";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 111;
			temp.x = 17;
			temp.y = 5;
			return temp;
		}

		private function familyOffice_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			familyOffice = temp;
			temp.name = "familyOffice";
			temp.text = "家族职位";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 81;
			temp.x = 383;
			temp.y = 5;
			return temp;
		}

		private function fightAmount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			fightAmount = temp;
			temp.name = "fightAmount";
			temp.text = "战力";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 284;
			temp.y = 5;
			return temp;
		}

		private function gongxian_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			gongxian = temp;
			temp.name = "gongxian";
			temp.text = "贡献";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 64;
			temp.x = 204;
			temp.y = 5;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 58;
			temp.x = 139;
			temp.y = 5;
			return temp;
		}

	}
}