package org.mokylin.skin.app.country.guild
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjianniuhong;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjixiaoanniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuildInviteListItemrenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var familyLeader:feathers.controls.Label;

		public var familyName:feathers.controls.Label;

		public var familyPlayer:feathers.controls.Label;

		public var fightAmount:feathers.controls.Label;

		public var leftBtn:feathers.controls.Button;

		public var level:feathers.controls.Label;

		public var rightBtn:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildInviteListItemrenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 29;
			this.elementsContent = [bg_i(),familyName_i(),familyLeader_i(),level_i(),fightAmount_i(),familyPlayer_i(),leftBtn_i(),rightBtn_i()];
			
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
			temp.height = 29;
			temp.styleName = "ui/common/kang/liebiao_di/liebiao_di.png";
			temp.width = 613;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function familyLeader_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			familyLeader = temp;
			temp.name = "familyLeader";
			temp.text = "家族名称七个字";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 115;
			temp.x = 127;
			temp.y = 5;
			return temp;
		}

		private function familyName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			familyName = temp;
			temp.name = "familyName";
			temp.text = "家族名称七个字";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 126;
			temp.x = 4;
			temp.y = 5;
			return temp;
		}

		private function familyPlayer_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			familyPlayer = temp;
			temp.name = "familyPlayer";
			temp.text = "99/100";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 91;
			temp.x = 387;
			temp.y = 5;
			return temp;
		}

		private function fightAmount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			fightAmount = temp;
			temp.name = "fightAmount";
			temp.text = "999";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 67;
			temp.x = 307;
			temp.y = 5;
			return temp;
		}

		private function leftBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			leftBtn = temp;
			temp.name = "leftBtn";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "通过";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_s_sanjixiaoanniu);
			temp.color = 0xF9F0CC;
			temp.x = 485;
			temp.y = 3;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.text = "999";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 59;
			temp.x = 237;
			temp.y = 5;
			return temp;
		}

		private function rightBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			rightBtn = temp;
			temp.name = "rightBtn";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "拒绝";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_s_sanjianniuhong);
			temp.color = 0xF9F0CC;
			temp.x = 539;
			temp.y = 3;
			return temp;
		}

	}
}