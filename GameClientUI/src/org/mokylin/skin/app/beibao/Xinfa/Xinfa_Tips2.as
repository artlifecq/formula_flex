package org.mokylin.skin.app.beibao.Xinfa
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.beibao.Xinfa.mc.UIMovieClipChongshu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Xinfa_Tips2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var gridSkill:feathers.controls.UIAsset;

		public var imgBg:feathers.controls.UIAsset;

		public var imgJiHuoTitle:feathers.controls.UIAsset;

		public var imgSkill:feathers.controls.UIAsset;

		public var imgXS:feathers.controls.UIAsset;

		public var lab_Ctrl:feathers.controls.Label;

		public var lab_jihuo:feathers.controls.Label;

		public var lab_name:feathers.controls.Label;

		public var lab_shuoming:feathers.controls.Label;

		public var lab_shuxing:feathers.controls.Label;

		public var lab_xiangsheng:feathers.controls.Label;

		public var line1:feathers.controls.UIAsset;

		public var line2:feathers.controls.UIAsset;

		public var line3:feathers.controls.UIAsset;

		public var line4:feathers.controls.UIAsset;

		public var line5:feathers.controls.UIAsset;

		public var mcLevel:feathers.controls.UIMovieClip;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Xinfa_Tips2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 360;
			this.width = 280;
			this.elementsContent = [imgBg_i(),line1_i(),line2_i(),line3_i(),line4_i(),line5_i(),lab_xiangsheng_i(),lab_shuoming_i(),lab_Ctrl_i(),imgXS_i(),gridSkill_i(),imgSkill_i(),imgJiHuoTitle_i(),lab_shuxing_i(),__Xinfa_Tips2_UIAsset1_i(),__Xinfa_Tips2_UIAsset2_i(),mcLevel_i(),lab_jihuo_i(),lab_name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Xinfa_Tips2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/tips/tipswenzi/jineng/zhuangtai.png";
			temp.x = 13;
			temp.y = 53;
			return temp;
		}

		private function __Xinfa_Tips2_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/yinzhangheng.png";
			temp.x = 63;
			temp.y = 49;
			return temp;
		}

		private function gridSkill_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			gridSkill = temp;
			temp.name = "gridSkill";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 13;
			temp.y = 167;
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 360;
			temp.styleName = "ui/common/tips/jinengdi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgJiHuoTitle_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgJiHuoTitle = temp;
			temp.name = "imgJiHuoTitle";
			temp.styleName = "ui/art_txt/common/tips/tipswenzi/jineng/jihuojiangli.png";
			temp.x = 13;
			temp.y = 92;
			return temp;
		}

		private function imgSkill_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgSkill = temp;
			temp.name = "imgSkill";
			temp.styleName = "ui/art_txt/common/tips/tipswenzi/jineng/xinfajiyi.png";
			temp.x = 13;
			temp.y = 146;
			return temp;
		}

		private function imgXS_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgXS = temp;
			temp.name = "imgXS";
			temp.styleName = "ui/art_txt/common/tips/tipswenzi/jineng/xinfaxiangsheng.png";
			temp.x = 13;
			temp.y = 239;
			return temp;
		}

		private function lab_Ctrl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_Ctrl = temp;
			temp.name = "lab_Ctrl";
			temp.htmlText = "按住<font color='#00ff33'>Ctrl</font>键固定Tips";
			temp.leading = 1;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 259;
			temp.x = 11;
			temp.y = 331;
			return temp;
		}

		private function lab_jihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_jihuo = temp;
			temp.name = "lab_jihuo";
			temp.text = "未激活";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.visible = false;
			temp.width = 56;
			temp.x = 68;
			temp.y = 51;
			return temp;
		}

		private function lab_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_name = temp;
			temp.name = "lab_name";
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "心法名称";
			temp.textAlign = "center";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 260;
			temp.x = 11;
			temp.y = 11;
			return temp;
		}

		private function lab_shuoming_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_shuoming = temp;
			temp.name = "lab_shuoming";
			temp.leading = 4;
			temp.text = "本心法倾向增强体力、攻击，建议在前期有限提升";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 259;
			temp.x = 11;
			temp.y = 294;
			return temp;
		}

		private function lab_shuxing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_shuxing = temp;
			temp.name = "lab_shuxing";
			temp.text = "最大气血：1000";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 17;
			temp.y = 108;
			return temp;
		}

		private function lab_xiangsheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_xiangsheng = temp;
			temp.name = "lab_xiangsheng";
			temp.htmlText = "与《<font color='#00ff33'>xxx</font>相生，本心法体力提升<font color='#00ff33'>12%</font>";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 259;
			temp.x = 11;
			temp.y = 256;
			return temp;
		}

		private function line1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line1 = temp;
			temp.name = "line1";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 7;
			temp.y = 39;
			return temp;
		}

		private function line2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line2 = temp;
			temp.name = "line2";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 9;
			temp.y = 78;
			return temp;
		}

		private function line3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line3 = temp;
			temp.name = "line3";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 7;
			temp.y = 134;
			return temp;
		}

		private function line4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line4 = temp;
			temp.name = "line4";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 7;
			temp.y = 226;
			return temp;
		}

		private function line5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line5 = temp;
			temp.name = "line5";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 7;
			temp.y = 282;
			return temp;
		}

		private function mcLevel_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mcLevel = temp;
			temp.name = "mcLevel";
			temp.autoPlay = false;
			temp.height = 18;
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.mc.UIMovieClipChongshu;
			temp.width = 52;
			temp.x = 69;
			temp.y = 51;
			return temp;
		}

	}
}