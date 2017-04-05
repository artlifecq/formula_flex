package org.mokylin.skin.app.tips
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.wuxue.jineng.mc.dengjiSkin;

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
		public var Icon:feathers.controls.UIAsset;

		public var bg:feathers.controls.UIAsset;

		public var eft_name:feathers.controls.Label;

		public var grp_head:feathers.controls.Group;

		public var grp_line:feathers.controls.Group;

		public var grp_rise_content:feathers.controls.Group;

		public var grp_rise_tite:feathers.controls.Group;

		public var grp_shuoming:feathers.controls.Group;

		public var is_act:feathers.controls.Label;

		public var lbl_dengji:feathers.controls.Label;

		public var lbl_jinengName:feathers.controls.Label;

		public var lbl_lenque:feathers.controls.Label;

		public var lbl_miaosu:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;

		public var lbl_xiaohao:feathers.controls.Label;

		public var line1:feathers.controls.UIAsset;

		public var mc_dengjie:feathers.controls.UIMovieClip;

		public var rise_des:feathers.controls.Label;

		public var rise_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jinengTips_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 334;
			this.width = 298;
			this.elementsContent = [bg_i(),grp_line_i(),Icon_i(),grp_head_i(),grp_shuoming_i(),grp_rise_content_i(),grp_rise_tite_i(),mc_dengjie_i()];
			
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
			temp.x = 10;
			temp.y = 12;
			return temp;
		}

		private function __jinengTips_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "冷却时间：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 27;
			return temp;
		}

		private function __jinengTips_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "消耗：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 50;
			return temp;
		}

		private function __jinengTips_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.text = "进阶效果";
			temp.color = 0xDFB01F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 76;
			temp.y = 0;
			return temp;
		}

		private function __jinengTips_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/48.png";
			temp.x = 3;
			temp.y = -1;
			return temp;
		}

		private function __jinengTips_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

		private function __jinengTips_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 144;
			temp.y = 6;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 335;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 298;
			temp.x = -2;
			temp.y = 2;
			return temp;
		}

		private function eft_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			eft_name = temp;
			temp.name = "eft_name";
			temp.height = 19;
			temp.fontSize = 12;
			temp.text = "的说法是";
			temp.textAlign = "center";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 64;
			temp.x = 1;
			temp.y = 58;
			return temp;
		}

		private function grp_head_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_head = temp;
			temp.name = "grp_head";
			temp.x = 97;
			temp.y = 17;
			temp.elementsContent = [lbl_name_i(),lbl_dengji_i(),__jinengTips_Skin_Label1_i(),lbl_lenque_i(),__jinengTips_Skin_Label2_i(),lbl_xiaohao_i()];
			return temp;
		}

		private function grp_line_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_line = temp;
			temp.name = "grp_line";
			temp.x = 16;
			temp.y = 94;
			temp.elementsContent = [line1_i()];
			return temp;
		}

		private function grp_rise_content_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_rise_content = temp;
			temp.name = "grp_rise_content";
			temp.height = 76;
			temp.width = 263;
			temp.x = 22;
			temp.y = 248;
			temp.elementsContent = [__jinengTips_Skin_UIAsset1_i(),rise_name_i(),is_act_i(),rise_des_i(),eft_name_i()];
			return temp;
		}

		private function grp_rise_tite_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_rise_tite = temp;
			temp.name = "grp_rise_tite";
			temp.x = 47;
			temp.y = 211;
			temp.elementsContent = [__jinengTips_Skin_UIAsset2_i(),__jinengTips_Skin_UIAsset3_i(),__jinengTips_Skin_Label3_i()];
			return temp;
		}

		private function grp_shuoming_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_shuoming = temp;
			temp.name = "grp_shuoming";
			temp.x = 7;
			temp.y = 107;
			temp.elementsContent = [lbl_jinengName_i(),lbl_miaosu_i()];
			return temp;
		}

		private function is_act_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			is_act = temp;
			temp.name = "is_act";
			temp.text = "【已激活】";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 133;
			temp.y = 1;
			return temp;
		}

		private function lbl_dengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_dengji = temp;
			temp.name = "lbl_dengji";
			temp.bold = false;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "Lv.31";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 96;
			temp.x = 91;
			temp.y = 2;
			return temp;
		}

		private function lbl_jinengName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_jinengName = temp;
			temp.name = "lbl_jinengName";
			temp.text = "【技能说明】";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_lenque_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_lenque = temp;
			temp.name = "lbl_lenque";
			temp.text = "无";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 72;
			temp.y = 27;
			return temp;
		}

		private function lbl_miaosu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_miaosu = temp;
			temp.name = "lbl_miaosu";
			temp.height = 65;
			temp.htmlText = "挥动长枪扫除一片火焰，对自身前方<font color='#5DBD37'>60</font>度半径<font color='#5DBD37'>10</font>米的扇形范围内的敌人造成<font color='#5DBD37'>3</font>次伤害，每次伤害<font color='#5DBD37'>25%</font>秒伤，每击中<font color='#5DBD37'>1</font>个目标可产生<font color='#5DBD37'>2</font>点怒气值";
			temp.text = "\"空雪\" 系列马屁，可获得称号 \"空雪\" ";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 273;
			temp.x = 6;
			temp.y = 23;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "侵掠如火";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 96;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_xiaohao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_xiaohao = temp;
			temp.name = "lbl_xiaohao";
			temp.text = "无";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 44;
			temp.y = 50;
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

		private function mc_dengjie_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_dengjie = temp;
			temp.name = "mc_dengjie";
			temp.autoPlay = false;
			temp.height = 10;
			temp.styleClass = org.mokylin.skin.app.wuxue.jineng.mc.dengjiSkin;
			temp.width = 10;
			temp.x = 69;
			temp.y = 68;
			return temp;
		}

		private function rise_des_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			rise_des = temp;
			temp.name = "rise_des";
			temp.height = 36;
			temp.text = "每击中一个目标额外产生3点怒气";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 183;
			temp.x = 75;
			temp.y = 23;
			return temp;
		}

		private function rise_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			rise_name = temp;
			temp.name = "rise_name";
			temp.text = "怒火中烧";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 191;
			temp.x = 68;
			temp.y = 1;
			return temp;
		}

	}
}