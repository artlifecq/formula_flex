package org.mokylin.skin.app.banghui.huangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HuangChengJieSuan extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var getRewardBtn:feathers.controls.Button;

		public var grpTitle:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var lbBangName:feathers.controls.Label;

		public var lbChengName:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var uiHead1:feathers.controls.UIAsset;

		public var uiHead2:feathers.controls.UIAsset;

		public var uiHead3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HuangChengJieSuan()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__HuangChengJieSuan_UIAsset1_i(),__HuangChengJieSuan_UIAsset2_i(),grpTitle_i(),icon1_i(),getRewardBtn_i(),lbTime_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HuangChengJieSuan_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 285;
			temp.styleName = "ui/app/banghui/jiesuan/ban1.png";
			temp.x = 31;
			temp.y = 129;
			return temp;
		}

		private function __HuangChengJieSuan_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/huangchengzhengbashengli.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HuangChengJieSuan_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/tiao.png";
			temp.x = 45;
			temp.y = 0;
			return temp;
		}

		private function getRewardBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			getRewardBtn = temp;
			temp.name = "getRewardBtn";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "领取奖励";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 110;
			temp.x = 210.5;
			temp.y = 361;
			return temp;
		}

		private function grpTitle_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpTitle = temp;
			temp.name = "grpTitle";
			temp.x = 26;
			temp.y = 205;
			temp.elementsContent = [__HuangChengJieSuan_UIAsset3_i(),uiHead1_i(),uiHead2_i(),uiHead3_i(),lbBangName_i(),lbChengName_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 33;
			temp.y = 248;
			return temp;
		}

		private function lbBangName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBangName = temp;
			temp.name = "lbBangName";
			temp.text = "帮派名称七个字";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 115;
			temp.x = 83;
			temp.y = 5;
			return temp;
		}

		private function lbChengName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbChengName = temp;
			temp.name = "lbChengName";
			temp.text = "皇城争霸";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 66;
			temp.x = 286;
			temp.y = 5;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "10秒后自动获取";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 106;
			temp.x = 212.5;
			temp.y = 338;
			return temp;
		}

		private function uiHead1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiHead1 = temp;
			temp.name = "uiHead1";
			temp.styleName = "ui/app/banghui/huangcheng/benfubangpai.png";
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function uiHead2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiHead2 = temp;
			temp.name = "uiHead2";
			temp.styleName = "ui/app/banghui/huangcheng/yingdeibenci.png";
			temp.x = 182;
			temp.y = 1;
			return temp;
		}

		private function uiHead3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiHead3 = temp;
			temp.name = "uiHead3";
			temp.styleName = "ui/app/banghui/huangcheng/quanfugfafangjiangli.png";
			temp.x = 344;
			temp.y = 1;
			return temp;
		}

	}
}