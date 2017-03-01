package org.mokylin.skin.common.tips
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
	public class jinengTips_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grp_head:feathers.controls.Group;

		public var grp_jinjiexiaoguo:feathers.controls.Group;

		public var grp_xiangqing:feathers.controls.Group;

		public var grp_xiangqing2:feathers.controls.Group;

		public var icons:feathers.controls.UIAsset;

		public var icons2:feathers.controls.UIAsset;

		public var lbl_Title:feathers.controls.Label;

		public var lbl_jihuo:feathers.controls.Label;

		public var lbl_jinengmiaoshu:feathers.controls.Label;

		public var lbl_jinengmiaoshu2:feathers.controls.Label;

		public var lbl_lengque:feathers.controls.Label;

		public var lbl_lv:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;

		public var lbl_xiaohao:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jinengTips_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__jinengTips_Skin_UIAsset1_i(),lbl_Title_i(),grp_head_i(),grp_xiangqing_i(),grp_jinjiexiaoguo_i(),grp_xiangqing2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __jinengTips_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "冷却时间:";
			temp.color = 0x8b8d7b;
			temp.x = 90;
			temp.y = 22;
			return temp;
		}

		private function __jinengTips_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "消耗: ";
			temp.color = 0x8b8d7b;
			temp.x = 90;
			temp.y = 50;
			return temp;
		}

		private function __jinengTips_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.text = "【技能详情】";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function __jinengTips_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.text = "【进阶效果】";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function __jinengTips_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.text = "【技能详情】";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function __jinengTips_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 428;
			temp.styleName = "ui/common/tips/tips_1.png";
			temp.width = 311;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __jinengTips_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 280;
			temp.x = 9;
			temp.y = 0;
			return temp;
		}

		private function __jinengTips_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 280;
			temp.x = 9;
			temp.y = 0;
			return temp;
		}

		private function __jinengTips_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 280;
			temp.x = 9;
			temp.y = 0;
			return temp;
		}

		private function grp_head_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_head = temp;
			temp.name = "grp_head";
			temp.x = 8;
			temp.y = 38;
			temp.elementsContent = [icons_i(),lbl_lv_i(),__jinengTips_Skin_Label1_i(),__jinengTips_Skin_Label2_i(),lbl_lengque_i(),lbl_xiaohao_i()];
			return temp;
		}

		private function grp_jinjiexiaoguo_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_jinjiexiaoguo = temp;
			temp.name = "grp_jinjiexiaoguo";
			temp.x = 4;
			temp.y = 250;
			temp.elementsContent = [__jinengTips_Skin_Label4_i(),lbl_name_i(),lbl_jihuo_i(),icons2_i(),__jinengTips_Skin_UIAsset3_i()];
			return temp;
		}

		private function grp_xiangqing2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_xiangqing2 = temp;
			temp.name = "grp_xiangqing2";
			temp.x = 4;
			temp.y = 358;
			temp.elementsContent = [__jinengTips_Skin_UIAsset4_i(),__jinengTips_Skin_Label5_i(),lbl_jinengmiaoshu2_i()];
			return temp;
		}

		private function grp_xiangqing_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_xiangqing = temp;
			temp.name = "grp_xiangqing";
			temp.x = 4;
			temp.y = 121;
			temp.elementsContent = [__jinengTips_Skin_UIAsset2_i(),__jinengTips_Skin_Label3_i(),lbl_jinengmiaoshu_i()];
			return temp;
		}

		private function icons2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icons2 = temp;
			temp.name = "icons2";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/60.png";
			temp.x = 4;
			temp.y = 29;
			return temp;
		}

		private function icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icons = temp;
			temp.name = "icons";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/60.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_Title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_Title = temp;
			temp.name = "lbl_Title";
			temp.bold = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "侵略如火";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 119;
			temp.y = 4;
			return temp;
		}

		private function lbl_jihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_jihuo = temp;
			temp.name = "lbl_jihuo";
			temp.bold = true;
			temp.text = "已激活";
			temp.color = 0x5DBD37;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 94;
			temp.y = 55;
			return temp;
		}

		private function lbl_jinengmiaoshu2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_jinengmiaoshu2 = temp;
			temp.name = "lbl_jinengmiaoshu2";
			temp.text = "每击中一个目标额外产生3点怒气";
			temp.color = 0x8b8d7b;
			temp.x = 6;
			temp.y = 26;
			return temp;
		}

		private function lbl_jinengmiaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_jinengmiaoshu = temp;
			temp.name = "lbl_jinengmiaoshu";
			temp.htmlText = "挥动长枪横扫出一片火焰，对自身前方60度半<br>径<font color='#5DBD37'>10</font>米的扇形范围内的敌人造成<font color='#5DBD37'>3次</font>伤害，每<br>次伤害<font color='#5DBD37'>25%</font>秒伤，每击中<font color='#5DBD37'>1</font>个目标可产生<font color='#5DBD37'>2</font>点<br>怒气值";
			temp.leading = -2;
			temp.text = "标签";
			temp.color = 0x8b8d7b;
			temp.x = 6;
			temp.y = 21;
			return temp;
		}

		private function lbl_lengque_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_lengque = temp;
			temp.name = "lbl_lengque";
			temp.text = "无";
			temp.color = 0xcfc6ae;
			temp.x = 156;
			temp.y = 23;
			return temp;
		}

		private function lbl_lv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_lv = temp;
			temp.name = "lbl_lv";
			temp.bold = true;
			temp.letterSpacing = 1;
			temp.text = "Lv.30";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 89;
			temp.y = 0;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = true;
			temp.letterSpacing = 2;
			temp.text = "侵略如火";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 94;
			temp.y = 31;
			return temp;
		}

		private function lbl_xiaohao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_xiaohao = temp;
			temp.name = "lbl_xiaohao";
			temp.text = "无";
			temp.color = 0xCFC6AE;
			temp.x = 126;
			temp.y = 50;
			return temp;
		}

	}
}