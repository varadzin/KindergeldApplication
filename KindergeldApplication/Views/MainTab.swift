//
//  MainTab.swift
//  KindergeldApp
//
//  Created by Frantisek Varadzin on 10.02.23.
//

import SwiftUI

struct MainTab: View {
  @State private var selectedTabIndex = 0

  var body: some View {
    TabView(selection: $selectedTabIndex) {
      InfoView()
        .tabItem {
          Label("MainTab_info", systemImage: "info.circle")
        }
        .tag(0)
      PayView(viewModel: PayViewModel())
        .tabItem {
          Label("MainTab_payDays", systemImage: "calendar")
        }
        .tag(1)
      FormView(viewModel: FormViewModel())
        .tabItem {
          Label("MainTab_forms", systemImage: "highlighter")
        }
        .tag(2)
        PrintView()
        .tabItem {
          Label("MainTab_print", systemImage: "doc.badge.arrow.up")
        }
        .tag(3)
        SettingsView()
        .tabItem {
          Label("Settings", systemImage: "gear")
        }
        .tag(4)
    }
  }
}
