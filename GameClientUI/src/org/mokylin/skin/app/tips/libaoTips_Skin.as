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
	public class libaoTips_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon:feathers.controls.UIAsset;

		public var grp_chushou:feathers.controls.Group;

		public var grp_icon:feathers.controls.Group;

		public var grp_line:feathers.controls.Group;

		public var grp_shuoming:feathers.controls.Group;

		public var grp_xinxi:feathers.controls.Group;

		public var lbl_dengji:feathers.controls.Label;

		public var lbl_lengque:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;

		public var lbl_shoujia:feathers.controls.Label;

		public var line1:feathers.controls.UIAsset;

		public var line2:feathers.controls.UIAsset;

		public var lock:feathers.controls.UIAsset;

		public var lock2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function libaoTips_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 253;
			this.width = 298;
			this.elementsContent = [__libaoTips_Skin_UIAsset1_i(),grp_line_i(),grp_icon_i(),lbl_name_i(),lock2_i(),__libaoTips_Skin_Label1_i(),grp_xinxi_i(),grp_shuoming_i(),grp_chushou_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon = temp;
			temp.name = "Icon";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/64.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __libaoTips_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "已绑定";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 114;
			temp.y = 49;
			return temp;
		}

		private function __libaoTips_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "等级要求：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __libaoTips_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "冷却时间：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 132;
			temp.y = 0;
			return temp;
		}

		private function __libaoTips_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "【物品说明】";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __libaoTips_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "礼包相关的文字描述";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 7;
			temp.y = 24;
			return temp;
		}

		private function __libaoTips_Skin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "售价（银两）：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __libaoTips_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 253;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 298;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __libaoTips_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yinzi_24.png";
			temp.x = 100;
			temp.y = -4;
			return temp;
		}

		private function grp_chushou_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_chushou = temp;
			temp.name = "grp_chushou";
			temp.x = 14;
			temp.y = 219;
			temp.elementsContent = [__libaoTips_Skin_Label6_i(),__libaoTips_Skin_UIAsset2_i(),lbl_shoujia_i()];
			return temp;
		}

		private function grp_icon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_icon = temp;
			temp.name = "grp_icon";
			temp.x = 10;
			temp.y = 12;
			temp.elementsContent = [Icon_i(),lock_i()];
			return temp;
		}

		private function grp_line_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_line = temp;
			temp.name = "grp_line";
			temp.x = 16;
			temp.y = 124;
			temp.elementsContent = [line1_i(),line2_i()];
			return temp;
		}

		private function grp_shuoming_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_shuoming = temp;
			temp.name = "grp_shuoming";
			temp.x = 8;
			temp.y = 139;
			temp.elementsContent = [__libaoTips_Skin_Label4_i(),__libaoTips_Skin_Label5_i()];
			return temp;
		}

		private function grp_xinxi_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_xinxi = temp;
			temp.name = "grp_xinxi";
			temp.x = 15;
			temp.y = 94;
			temp.elementsContent = [__libaoTips_Skin_Label2_i(),__libaoTips_Skin_Label3_i(),lbl_dengji_i(),lbl_lengque_i()];
			return temp;
		}

		private function lbl_dengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_dengji = temp;
			temp.name = "lbl_dengji";
			temp.text = "85";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 71;
			temp.y = 0;
			return temp;
		}

		private function lbl_lengque_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_lengque = temp;
			temp.name = "lbl_lengque";
			temp.text = "0.200秒";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 204;
			temp.y = 0;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = true;
			temp.fontSize = 16;
			temp.text = "礼包类Tips";
			temp.textAlign = "left";
			temp.color = 0x25931B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 196;
			temp.x = 96;
			temp.y = 19;
			return temp;
		}

		private function lbl_shoujia_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_shoujia = temp;
			temp.name = "lbl_shoujia";
			temp.text = "100";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 123;
			temp.x = 126;
			temp.y = 1;
			return temp;
		}

		private function line1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line1 = temp;
			temp.name = "line1";
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 267;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function line2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line2 = temp;
			temp.name = "line2";
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 267;
			temp.x = 0;
			temp.y = 81;
			return temp;
		}

		private function lock2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lock2 = temp;
			temp.name = "lock2";
			temp.styleName = "ui/common/tubiao/suo.png";
			temp.x = 100;
			temp.y = 49;
			return temp;
		}

		private function lock_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lock = temp;
			temp.name = "lock";
			temp.styleName = "ui/common/tubiao/suo.png";
			temp.x = 8;
			temp.y = 53;
			return temp;
		}

	}
}