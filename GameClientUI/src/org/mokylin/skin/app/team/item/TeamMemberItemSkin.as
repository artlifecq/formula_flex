package org.mokylin.skin.app.team.item
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamMemberItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var group:feathers.controls.Group;

		public var guildName:feathers.controls.Label;

		public var imgBg:feathers.controls.UIAsset;

		public var labTimer:feathers.controls.Label;

		public var name:feathers.controls.Label;

		public var position:feathers.controls.Label;

		public var sp:feathers.controls.UIAsset;

		public var staticType_duizhang:feathers.controls.UIAsset;

		public var staticType_likai:feathers.controls.UIAsset;

		public var staticType_yuanli:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamMemberItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 328;
			this.width = 163;
			this.elementsContent = [imgBg_i(),group_i(),staticType_likai_i(),staticType_yuanli_i(),staticType_duizhang_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [name_i(),guildName_i(),position_i(),labTimer_i(),sp_i()];
			return temp;
		}

		private function guildName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guildName = temp;
			temp.name = "guildName";
			temp.height = 22;
			temp.text = "帮帮帮帮派名称";
			temp.textAlign = "center";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 163;
			temp.x = 0;
			temp.y = 270;
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 328;
			temp.styleName = "ui/app/team/ren_wu_di.png";
			temp.width = 163;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labTimer_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTimer = temp;
			temp.name = "labTimer";
			temp.height = 22;
			temp.fontSize = 12;
			temp.text = "自动退队倒计时:500";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 0;
			temp.y = 225;
			return temp;
		}

		private function name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			name = temp;
			temp.name = "name";
			temp.height = 22;
			temp.fontSize = 12;
			temp.text = "玩家名称七个字（99级）";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 155;
			temp.x = 4;
			temp.y = 250;
			return temp;
		}

		private function position_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			position = temp;
			temp.name = "position";
			temp.height = 22;
			temp.text = "【荆州】洛阳城";
			temp.textAlign = "center";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 155;
			temp.x = 4;
			temp.y = 290;
			return temp;
		}

		private function sp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sp = temp;
			temp.name = "sp";
			temp.height = 246;
			temp.width = 163;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function staticType_duizhang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			staticType_duizhang = temp;
			temp.name = "staticType_duizhang";
			temp.height = 76;
			temp.styleName = "ui/app/team/duizhang.png";
			temp.width = 23;
			temp.x = 25;
			temp.y = 150;
			return temp;
		}

		private function staticType_likai_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			staticType_likai = temp;
			temp.name = "staticType_likai";
			temp.height = 76;
			temp.styleName = "ui/app/team/likai.png";
			temp.width = 23;
			temp.x = 110;
			temp.y = 150;
			return temp;
		}

		private function staticType_yuanli_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			staticType_yuanli = temp;
			temp.name = "staticType_yuanli";
			temp.height = 76;
			temp.styleName = "ui/app/team/yuanli.png";
			temp.width = 23;
			temp.x = 110;
			temp.y = 150;
			return temp;
		}

	}
}