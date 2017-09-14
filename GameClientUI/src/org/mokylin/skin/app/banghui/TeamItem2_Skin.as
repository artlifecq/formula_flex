package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.ItemBg;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamItem2_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var lbOnLine:feathers.controls.Label;

		public var lbRolenName:feathers.controls.Label;

		public var lbTeamName:feathers.controls.Label;

		public var lbZhanli:feathers.controls.Label;

		public var lbZhouHuoYue:feathers.controls.Label;

		public var lbZongHuoYue:feathers.controls.Label;

		public var numList2:feathers.controls.Label;

		public var uiFirt:feathers.controls.UIAsset;

		public var uiTongShuai:feathers.controls.UIAsset;

		public var uivip:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamItem2_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 33;
			this.width = 908;
			this.elementsContent = [bg_i(),uiFirt_i(),numList2_i(),lbTeamName_i(),lbZhanli_i(),lbRolenName_i(),lbZhouHuoYue_i(),lbZongHuoYue_i(),lbOnLine_i(),uiTongShuai_i(),uivip_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 33;
			var skin:StateSkin = new org.mokylin.skin.common.ItemBg()
			temp.skin = skin
			temp.width = 908;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbOnLine_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbOnLine = temp;
			temp.name = "lbOnLine";
			temp.text = "在线";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 848;
			temp.y = 8;
			return temp;
		}

		private function lbRolenName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbRolenName = temp;
			temp.name = "lbRolenName";
			temp.htmlText = "100级<font color='#ff0000'>兵家</font>";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 79;
			temp.x = 494;
			temp.y = 8;
			return temp;
		}

		private function lbTeamName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTeamName = temp;
			temp.name = "lbTeamName";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "[00000]玩家名六个字";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 160;
			temp.x = 168;
			temp.y = 8;
			return temp;
		}

		private function lbZhanli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanli = temp;
			temp.name = "lbZhanli";
			temp.text = "9999999999";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 133;
			temp.x = 334;
			temp.y = 8;
			return temp;
		}

		private function lbZhouHuoYue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhouHuoYue = temp;
			temp.name = "lbZhouHuoYue";
			temp.text = "999/999";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 75;
			temp.x = 616;
			temp.y = 8;
			return temp;
		}

		private function lbZongHuoYue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZongHuoYue = temp;
			temp.name = "lbZongHuoYue";
			temp.text = "999999999";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 88;
			temp.x = 717;
			temp.y = 8;
			return temp;
		}

		private function numList2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			numList2 = temp;
			temp.name = "numList2";
			temp.text = "帮主删掉";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 62;
			temp.x = 53;
			temp.y = 9;
			return temp;
		}

		private function uiFirt_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFirt = temp;
			temp.name = "uiFirt";
			temp.styleName = "ui/app/banghui/huawen.png";
			temp.x = 0;
			temp.y = 11;
			return temp;
		}

		private function uiTongShuai_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiTongShuai = temp;
			temp.name = "uiTongShuai";
			temp.styleName = "ui/app/banghui/tongshuaitubiao.png";
			temp.x = 22;
			temp.y = 0;
			return temp;
		}

		private function uivip_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uivip = temp;
			temp.name = "uivip";
			temp.styleName = "ui/common/tubiao/vips2.png";
			temp.x = 134;
			temp.y = 6;
			return temp;
		}

	}
}