package org.mokylin.skin.app.beibao.Xinfa
{
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.beibao.Xinfa.button.ButtonJiuxiao;
	import org.mokylin.skin.app.beibao.Xinfa.button.ButtonLongxiang;
	import org.mokylin.skin.app.beibao.Xinfa.button.ButtonXiaoyao;
	import org.mokylin.skin.app.beibao.Xinfa.button.ButtonXidong;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class btnGruop_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_chunyang:feathers.controls.Radio;

		public var btn_jiuxiao:feathers.controls.Radio;

		public var btn_longxiang:feathers.controls.Radio;

		public var btn_mingxin:feathers.controls.Radio;

		public var btn_qiankun:feathers.controls.Radio;

		public var btn_shijue:feathers.controls.Radio;

		public var btn_wanji:feathers.controls.Radio;

		public var btn_xiaoyao:feathers.controls.Radio;

		public var btn_xijing:feathers.controls.Radio;

		public var btn_zhenyuan:feathers.controls.Radio;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function btnGruop_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btn_longxiang_i(),btn_shijue_i(),btn_xiaoyao_i(),btn_qiankun_i(),btn_chunyang_i(),btn_xijing_i(),btn_zhenyuan_i(),btn_jiuxiao_i(),btn_mingxin_i(),btn_wanji_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_chunyang_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_chunyang = temp;
			temp.name = "btn_chunyang";
			temp.groupName = "xfradioGroup";
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.button.ButtonLongxiang;
			temp.x = 0;
			temp.y = 380;
			return temp;
		}

		private function btn_jiuxiao_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_jiuxiao = temp;
			temp.name = "btn_jiuxiao";
			temp.groupName = "xfradioGroup";
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.button.ButtonJiuxiao;
			temp.x = 0;
			temp.y = 532;
			return temp;
		}

		private function btn_longxiang_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_longxiang = temp;
			temp.name = "btn_longxiang";
			temp.groupName = "xfradioGroup";
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.button.ButtonLongxiang;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_mingxin_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_mingxin = temp;
			temp.name = "btn_mingxin";
			temp.groupName = "xfradioGroup";
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.button.ButtonLongxiang;
			temp.x = 0;
			temp.y = 608;
			return temp;
		}

		private function btn_qiankun_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_qiankun = temp;
			temp.name = "btn_qiankun";
			temp.groupName = "xfradioGroup";
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.button.ButtonLongxiang;
			temp.x = 0;
			temp.y = 228;
			return temp;
		}

		private function btn_shijue_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_shijue = temp;
			temp.name = "btn_shijue";
			temp.groupName = "xfradioGroup";
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.button.ButtonLongxiang;
			temp.x = 0;
			temp.y = 76;
			return temp;
		}

		private function btn_wanji_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_wanji = temp;
			temp.name = "btn_wanji";
			temp.groupName = "xfradioGroup";
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.button.ButtonLongxiang;
			temp.x = 0;
			temp.y = 684;
			return temp;
		}

		private function btn_xiaoyao_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_xiaoyao = temp;
			temp.name = "btn_xiaoyao";
			temp.groupName = "xfradioGroup";
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.button.ButtonXiaoyao;
			temp.x = 0;
			temp.y = 152;
			return temp;
		}

		private function btn_xijing_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_xijing = temp;
			temp.name = "btn_xijing";
			temp.groupName = "xfradioGroup";
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.button.ButtonXidong;
			temp.x = 0;
			temp.y = 304;
			return temp;
		}

		private function btn_zhenyuan_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_zhenyuan = temp;
			temp.name = "btn_zhenyuan";
			temp.groupName = "xfradioGroup";
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.button.ButtonLongxiang;
			temp.x = 0;
			temp.y = 456;
			return temp;
		}

	}
}