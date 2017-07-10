package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.common.ItemBg;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class WangChengJieSuan_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var lbJifenAll:feathers.controls.Label;

		public var lbJishaNum:feathers.controls.Label;

		public var lbNo:feathers.controls.Label;

		public var lbTeamName:feathers.controls.Label;

		public var lbZhiYe:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WangChengJieSuan_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 27;
			this.width = 873;
			this.elementsContent = [bg_i(),lbNo_i(),lbTeamName_i(),lbZhiYe_i(),lbJishaNum_i(),lbJifenAll_i()];
			
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
			temp.width = 873;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbJifenAll_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJifenAll = temp;
			temp.name = "lbJifenAll";
			temp.text = "9000";
			temp.textAlign = "center";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 73;
			temp.x = 731;
			temp.y = 4;
			return temp;
		}

		private function lbJishaNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJishaNum = temp;
			temp.name = "lbJishaNum";
			temp.text = "100";
			temp.textAlign = "center";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 64;
			temp.x = 548;
			temp.y = 4;
			return temp;
		}

		private function lbNo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNo = temp;
			temp.name = "lbNo";
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 23;
			temp.x = 30;
			temp.y = 4;
			return temp;
		}

		private function lbTeamName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTeamName = temp;
			temp.name = "lbTeamName";
			temp.text = "玩家名称六字";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = false;
			temp.width = 160;
			temp.x = 91;
			temp.y = 4;
			return temp;
		}

		private function lbZhiYe_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhiYe = temp;
			temp.name = "lbZhiYe";
			temp.text = "兵家";
			temp.textAlign = "left";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 43;
			temp.x = 359;
			temp.y = 4;
			return temp;
		}

	}
}