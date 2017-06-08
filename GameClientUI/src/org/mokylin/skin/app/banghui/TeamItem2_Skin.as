package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.ItemBg;

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
		public var lbOnLine:feathers.controls.Label;

		public var lbRolenName:feathers.controls.Label;

		public var lbTeamName:feathers.controls.Label;

		public var lbZhanli:feathers.controls.Label;

		public var lbZhouHuoYue:feathers.controls.Label;

		public var lbZongHuoYue:feathers.controls.Label;

		public var numList2:feathers.controls.Label;

		public var uiFirt:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamItem2_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 36;
			this.width = 896;
			this.elementsContent = [__TeamItem2_Skin_SkinnableContainer1_i(),uiFirt_i(),numList2_i(),lbTeamName_i(),lbZhanli_i(),lbRolenName_i(),lbZhouHuoYue_i(),lbZongHuoYue_i(),lbOnLine_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TeamItem2_Skin_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 36;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.ItemBg()
			temp.skin = skin
			temp.width = 896;
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
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 827;
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
			temp.x = 434;
			temp.y = 8;
			return temp;
		}

		private function lbTeamName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTeamName = temp;
			temp.name = "lbTeamName";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "玩家名六个字";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 106;
			temp.x = 148;
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
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 133;
			temp.x = 278;
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
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 75;
			temp.x = 558;
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
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 88;
			temp.x = 677;
			temp.y = 8;
			return temp;
		}

		private function numList2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			numList2 = temp;
			temp.name = "numList2";
			temp.text = "帮主";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
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
			temp.y = 14;
			return temp;
		}

	}
}