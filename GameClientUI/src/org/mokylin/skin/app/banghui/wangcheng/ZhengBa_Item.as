package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.banghui.button.ButtonJingpai;
	import org.mokylin.skin.common.ItemBg;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZhengBa_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnPai:feathers.controls.Button;

		public var lbCityName:feathers.controls.Label;

		public var lbJiage:feathers.controls.Label;

		public var lbTeamName1:feathers.controls.Label;

		public var lbTeamName2:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhengBa_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 27;
			this.width = 599;
			this.elementsContent = [bg_i(),lbCityName_i(),lbTeamName1_i(),lbTeamName2_i(),lbJiage_i(),lbTime_i(),btnPai_i()];
			
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
			temp.height = 27;
			var skin:StateSkin = new org.mokylin.skin.common.ItemBg()
			temp.skin = skin
			temp.width = 599;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnPai_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPai = temp;
			temp.name = "btnPai";
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonJingpai;
			temp.x = 526;
			temp.y = 0;
			return temp;
		}

		private function lbCityName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCityName = temp;
			temp.name = "lbCityName";
			temp.text = "中卫";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 52;
			temp.x = 7;
			temp.y = 4;
			return temp;
		}

		private function lbJiage_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJiage = temp;
			temp.name = "lbJiage";
			temp.text = "100000";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = false;
			temp.width = 88;
			temp.x = 314;
			temp.y = 4;
			return temp;
		}

		private function lbTeamName1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTeamName1 = temp;
			temp.name = "lbTeamName1";
			temp.text = "帮派名称七个字";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 109;
			temp.x = 71;
			temp.y = 4;
			return temp;
		}

		private function lbTeamName2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTeamName2 = temp;
			temp.name = "lbTeamName2";
			temp.text = "帮派名称七个字";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 109;
			temp.x = 191;
			temp.y = 4;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "00：30：00";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = false;
			temp.width = 88;
			temp.x = 420;
			temp.y = 4;
			return temp;
		}

	}
}