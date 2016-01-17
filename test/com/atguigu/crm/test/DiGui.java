package com.atguigu.crm.test;

public class DiGui {
	public static void main(String[] args) {
		doubleNum(1);
	}

	public static void doubleNum(int n) {
		//System.out.println(n);
		if (n < 10) {
			doubleNum(n + 1);// 这个地方难道是线程停止了吗？ 还是什么呢 他会把前面的先放
		} // 暂停 然后回调方法，当方法里面不符合的时候 他会把以前的 最后面的先执行 在吧前面面暂停的补上
		System.out.println(n);
	}
}
