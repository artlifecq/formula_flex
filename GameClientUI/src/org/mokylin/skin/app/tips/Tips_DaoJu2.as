package org.mokylin.skin.app.tips
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
	public class Tips_DaoJu2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var grp_foot:feathers.controls.Group;

		public var grp_type:feathers.controls.Group;

		public var lbCurrentNum:feathers.controls.Label;

		public var lbFangYu:feathers.controls.Label;

		public var lbGongJi:feathers.controls.Label;

		public var lbLuJing:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbNextName:feathers.controls.Label;

		public var lbShengMing:feathers.controls.Label;

		public var lbShuxing:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_DaoJu2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 311;
			this.width = 281;
			this.elementsContent = [bg_i(),__Tips_DaoJu2_UIAsset1_i(),lbName_i(),__Tips_DaoJu2_Label1_i(),__Tips_DaoJu2_Label2_i(),lbShuxing_i(),lbCurrentNum_i(),lbNextName_i(),grp_foot_i(),grp_type_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_DaoJu2_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前使用：";
			temp.color = 0x958D70;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 108;
			temp.y = 62;
			return temp;
		}

		private function __Tips_DaoJu2_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "下一阶数可使用个数：";
			temp.color = 0x958D70;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 29;
			temp.y = 115;
			return temp;
		}

		private function __Tips_DaoJu2_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 18;
			temp.text = "获取途径：";
			temp.color = 0x958D70;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 119;
			temp.x = 17;
			temp.y = 8;
			return temp;
		}

		private function __Tips_DaoJu2_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "攻  击";
			temp.color = 0x958D70;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Tips_DaoJu2_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "防  御";
			temp.color = 0x958D70;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 22;
			return temp;
		}

		private function __Tips_DaoJu2_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "生  命";
			temp.color = 0x958D70;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 45;
			return temp;
		}

		private function __Tips_DaoJu2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 10;
			temp.y = 99;
			return temp;
		}

		private function __Tips_DaoJu2_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 311;
			temp.styleName = "ui/common/tips/diban.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grp_foot_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_foot = temp;
			temp.name = "grp_foot";
			temp.x = 10;
			temp.y = 237;
			temp.elementsContent = [__Tips_DaoJu2_UIAsset2_i(),lbLuJing_i(),__Tips_DaoJu2_Label3_i()];
			return temp;
		}

		private function grp_type_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_type = temp;
			temp.name = "grp_type";
			temp.x = 29;
			temp.y = 165;
			temp.elementsContent = [__Tips_DaoJu2_Label4_i(),__Tips_DaoJu2_Label5_i(),__Tips_DaoJu2_Label6_i(),lbGongJi_i(),lbFangYu_i(),lbShengMing_i()];
			return temp;
		}

		private function lbCurrentNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCurrentNum = temp;
			temp.name = "lbCurrentNum";
			temp.text = "130/130个";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 174;
			temp.y = 63;
			return temp;
		}

		private function lbFangYu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbFangYu = temp;
			temp.name = "lbFangYu";
			temp.text = "+30";
			temp.color = 0xE2D8BE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 132;
			temp.x = 64;
			temp.y = 23;
			return temp;
		}

		private function lbGongJi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbGongJi = temp;
			temp.name = "lbGongJi";
			temp.text = "+30";
			temp.color = 0xE2D8BE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 132;
			temp.x = 64;
			temp.y = 1;
			return temp;
		}

		private function lbLuJing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLuJing = temp;
			temp.name = "lbLuJing";
			temp.height = 18;
			temp.text = "跨服组队副本";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 119;
			temp.x = 17;
			temp.y = 30;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 16;
			temp.text = "坐骑资质丹";
			temp.color = 0xE2D8BE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 120;
			temp.x = 109;
			temp.y = 23;
			return temp;
		}

		private function lbNextName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNextName = temp;
			temp.name = "lbNextName";
			temp.text = "85个";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 169;
			temp.y = 116;
			return temp;
		}

		private function lbShengMing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShengMing = temp;
			temp.name = "lbShengMing";
			temp.text = "+30";
			temp.color = 0xE2D8BE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 132;
			temp.x = 64;
			temp.y = 46;
			return temp;
		}

		private function lbShuxing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShuxing = temp;
			temp.name = "lbShuxing";
			temp.text = "每颗资质丹永久增加战骑属性：";
			temp.color = 0x958D70;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 29;
			temp.y = 140;
			return temp;
		}

	}
}