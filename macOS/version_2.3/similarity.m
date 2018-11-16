function [SimAB] = similarity(pdpA, pdpB)

SimAB = sum(((pdpA.*pdpB).^0.5));