package org.mokylin.skin.app.banghui.wangcheng
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
	public class ZhanBaoInfo_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbCityName:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbTeamVS:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var uiSheng:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhanBaoInfo_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 27;
			this.width = 599;
			this.elementsContent = [__ZhanBaoInfo_Item_SkinnableContainer1_i(),lbCityName_i(),lbTime_i(),lbTeamVS_i(),lbName_i(),uiSheng_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ZhanBaoInfo_Item_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 27;
			var skin:StateSkin = new org.mokylin.skin.common.ItemBg()
			temp.skin = skin
			temp.width = 599;
			temp.x = 0;
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
			temp.x = 15;
			temp.y = 4;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "帮派名称七个字";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = false;
			temp.width = 112;
			temp.x = 486;
			temp.y = 4;
			return temp;
		}

		private function lbTeamVS_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTeamVS = temp;
			temp.name = "lbTeamVS";
			temp.text = "帮派名称七个字VS帮派名称七个字";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 228;
			temp.x = 252;
			temp.y = 4;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "2017年6月13日20时00分";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 159;
			temp.x = 84;
			temp.y = 4;
			return temp;
		}

		private function uiSheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiSheng = temp;
			temp.name = "uiSheng";
			temp.styleName = "ui/app/banghui/wangcheng/sheng.png";
			temp.x = 584;
			temp.y = 0;
			return temp;
		}

	}
}