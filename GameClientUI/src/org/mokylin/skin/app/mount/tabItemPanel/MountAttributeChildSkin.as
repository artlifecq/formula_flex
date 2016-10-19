package org.mokylin.skin.app.mount.tabItemPanel
{
	import feathers.controls.text.Fontter;
	import flash.filters.GlowFilter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountAttributeChildSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var group:feathers.controls.Group;

		public var groupIcon:feathers.controls.Group;

		public var labFeedDegree:feathers.controls.Label;

		public var labGenGu:feathers.controls.Label;

		public var labLevel:feathers.controls.Label;

		public var labLiftTime:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var labSex:feathers.controls.Label;

		public var labSpeed:feathers.controls.Label;

		public var labTypeName:feathers.controls.Label;

		public var labZiZhi:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var topGroup:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountAttributeChildSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 464;
			this.width = 285;
			labelFilterBlack_i();
			this.elementsContent = [__MountAttributeChildSkin_UIAsset1_i(),__MountAttributeChildSkin_UIAsset2_i(),__MountAttributeChildSkin_Label1_i(),__MountAttributeChildSkin_Label2_i(),__MountAttributeChildSkin_Label3_i(),topGroup_i(),group_i(),groupIcon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountAttributeChildSkin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "性     别";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 10;
			temp.y = 60;
			return temp;
		}

		private function __MountAttributeChildSkin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "物     种";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 10;
			temp.y = 34;
			return temp;
		}

		private function __MountAttributeChildSkin_Label12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "姓     名";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 10;
			temp.y = 7;
			return temp;
		}

		private function __MountAttributeChildSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "属性";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 5;
			temp.y = 247;
			return temp;
		}

		private function __MountAttributeChildSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "转化率";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 86;
			temp.x = 125;
			temp.y = 247;
			return temp;
		}

		private function __MountAttributeChildSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "成长";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 75;
			temp.x = 201;
			temp.y = 247;
			return temp;
		}

		private function __MountAttributeChildSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "根     骨";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 10;
			temp.y = 216;
			return temp;
		}

		private function __MountAttributeChildSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "资     质";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 10;
			temp.y = 189;
			return temp;
		}

		private function __MountAttributeChildSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "寿     命";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 10;
			temp.y = 163;
			return temp;
		}

		private function __MountAttributeChildSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "速     度";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 10;
			temp.y = 137;
			return temp;
		}

		private function __MountAttributeChildSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "饱 食 度";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 10;
			temp.y = 111;
			return temp;
		}

		private function __MountAttributeChildSkin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "携带等级";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 10;
			temp.y = 86;
			return temp;
		}

		private function __MountAttributeChildSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mount/img/lie_biao-.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MountAttributeChildSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/liebiao/lie_biao_di.png";
			temp.width = 265;
			temp.x = 9;
			temp.y = 244;
			return temp;
		}

		private function __MountAttributeChildSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 8;
			temp.verticalAlign = "bottom";
			return temp;
		}

		private function __MountAttributeChildSkin_VerticalLayout2_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 3;
			temp.paddingTop = 5;
			return temp;
		}

		private function groupIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupIcon = temp;
			temp.name = "groupIcon";
			temp.height = 105;
			temp.width = 20;
			temp.x = 257;
			temp.y = 270;
			temp.layout = __MountAttributeChildSkin_VerticalLayout2_i();
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.height = 105;
			temp.width = 250;
			temp.x = 9;
			temp.y = 270;
			temp.layout = __MountAttributeChildSkin_VerticalLayout1_i();
			return temp;
		}

		private function labFeedDegree_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labFeedDegree = temp;
			temp.name = "labFeedDegree";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "850/1000";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 97;
			temp.y = 111;
			return temp;
		}

		private function labGenGu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labGenGu = temp;
			temp.name = "labGenGu";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "+ 9";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 97;
			temp.y = 216;
			return temp;
		}

		private function labLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLevel = temp;
			temp.name = "labLevel";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "110";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 97;
			temp.y = 85;
			return temp;
		}

		private function labLiftTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLiftTime = temp;
			temp.name = "labLiftTime";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "10000";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 97;
			temp.y = 162;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "勇猛的紫金赤兔";
			temp.textAlign = "right";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 97;
			temp.y = 7;
			return temp;
		}

		private function labSex_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSex = temp;
			temp.name = "labSex";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "雄";
			temp.textAlign = "right";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 97;
			temp.y = 59;
			return temp;
		}

		private function labSpeed_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSpeed = temp;
			temp.name = "labSpeed";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 97;
			temp.y = 136;
			return temp;
		}

		private function labTypeName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTypeName = temp;
			temp.name = "labTypeName";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "紫金赤兔";
			temp.textAlign = "right";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 95;
			temp.y = 33;
			return temp;
		}

		private function labZiZhi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labZiZhi = temp;
			temp.name = "labZiZhi";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "完美";
			temp.textAlign = "right";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 100;
			temp.y = 189;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 0.8;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function topGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			topGroup = temp;
			temp.name = "topGroup";
			temp.height = 241;
			temp.width = 286;
			temp.x = 0;
			temp.y = 6;
			temp.elementsContent = [__MountAttributeChildSkin_Label4_i(),labGenGu_i(),__MountAttributeChildSkin_Label5_i(),labZiZhi_i(),__MountAttributeChildSkin_Label6_i(),labLiftTime_i(),__MountAttributeChildSkin_Label7_i(),labSpeed_i(),__MountAttributeChildSkin_Label8_i(),labFeedDegree_i(),__MountAttributeChildSkin_Label9_i(),labLevel_i(),__MountAttributeChildSkin_Label10_i(),labSex_i(),__MountAttributeChildSkin_Label11_i(),labTypeName_i(),__MountAttributeChildSkin_Label12_i(),labName_i()];
			return temp;
		}

	}
}