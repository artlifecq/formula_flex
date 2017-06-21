package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.banghui.ItemBg;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class WangChengPaiMing_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var lbBanghui:feathers.controls.Label;

		public var lbNo:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WangChengPaiMing_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 27;
			this.width = 271;
			this.elementsContent = [bg_i(),lbNo_i(),lbBanghui_i()];
			
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
			var skin:StateSkin = new org.mokylin.skin.app.banghui.ItemBg()
			temp.skin = skin
			temp.width = 271;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbBanghui_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBanghui = temp;
			temp.name = "lbBanghui";
			temp.text = "帮派名称一个字";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 148;
			temp.x = 103;
			temp.y = 6;
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
			temp.underline = true;
			temp.width = 66;
			temp.x = 17;
			temp.y = 6;
			return temp;
		}

	}
}